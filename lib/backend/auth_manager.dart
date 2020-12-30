import 'package:staff_maintenance_app/backend/http_error.dart';
import 'package:staff_maintenance_app/configs/backend_config.dart';
import 'package:staff_maintenance_app/fcm/fcm_manager.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/logger.dart';
import 'package:staff_maintenance_app/storage/auth_storage.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staff_maintenance_app/ui/screen/login/login_screen.dart';
import 'package:synchronized/synchronized.dart' as synchronized;

@lazySingleton
class AuthManager {
  final _dio = Dio();

  Future<AuthToken> login(String phoneNumber, String password) async {
    try {
      logger.d("Logging in - phone $phoneNumber, password $password");

      final response = await _dio.post("${BackendConfig.BASE_URL}/api/login/staff_maintenance", data: {
        "PhoneNumber": phoneNumber,
        "Password": password
      });
      final data = response.data as Map<String, dynamic>;
      final accessToken = data["accessToken"] as String;
      final refreshToken = data["refreshToken"] as String;
      final expiredIn = DateTime.fromMillisecondsSinceEpoch((data["expiredIn"] as int)*1000);
      final authToken = AuthToken(accessToken, refreshToken, expiredIn);
      locator<AuthStorage>().set(authToken);
      await locator<FcmManager>().registerToken();

      logger.d("Logged in - credentials $authToken");

      return authToken;
    } on DioError catch (e) {
      throw HttpError(e);
    }
  }

  Future<AuthToken> _refresh({AuthToken authToken}) async {
    authToken ??= locator<AuthStorage>().get();

    logger.d("Refreshing - credentials $authToken");

    if (authToken == null) {
      throw StateError("Auth Token must be not null");
    }

    final response = await _dio.post("${BackendConfig.BASE_URL}/api/token/refresh", data: {
      "RefreshToken": authToken.refreshToken
    });
    final data = response.data as Map<String, dynamic>;
    final accessToken = data["accessToken"] as String;
    final refreshToken = data["refreshToken"] as String;
    final expiredIn = DateTime.fromMillisecondsSinceEpoch((data["expiredIn"] as int)*1000);
    final newToken = AuthToken(accessToken, refreshToken, expiredIn);
    locator<AuthStorage>().set(newToken);

    logger.d("Refreshed - credentials $newToken");

    return newToken;
  }

  Future<void> logout() async {
    logger.d("Logging out");

    await locator<FcmManager>().unregisterToken();
    await locator<SharedPreferences>().clear();

    logger.d("Logged out");

    Get.offAll(LoginScreen());
  }

  bool isLoggedIn() {
    final AuthToken token = locator<AuthStorage>().get();
    return token != null && !token.isExpired;
  }

  Future<String> getAccessToken() async {
    AuthToken token = locator<AuthStorage>().get();

    if (token?.accessToken == null) {
      return null;
    }

    if (token.isExpired) {
      await synchronized.Lock().synchronized(() async {
        if(token.isExpired) {
          token = await _refresh(authToken: token);
        }
      });
      // ignore: invariant_booleans
      if (token == null) {
        return null;
      }
    }

    return token.accessToken;
  }
}
