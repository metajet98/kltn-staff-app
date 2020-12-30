import 'dart:io';

import 'package:staff_maintenance_app/backend/auth_manager.dart';
import 'package:staff_maintenance_app/backend/http_error.dart';
import 'package:staff_maintenance_app/configs/app_config.dart';
import 'package:staff_maintenance_app/configs/backend_config.dart';
import 'package:staff_maintenance_app/event_bus.dart';
import 'package:staff_maintenance_app/events/http_unauthorized_response_event.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/logger.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@lazySingleton
class HttpClient {
  Dio dio = Dio();

  HttpClient() {
    dio.options = BaseOptions(
      baseUrl: BackendConfig.BASE_URL,
      connectTimeout: BackendConfig.CONNECT_TIMEOUT,
      receiveTimeout: BackendConfig.RECEIVE_TIMEOUT,
    );

    if (AppConfig.DEBUG) {
      final Logger _logger = Logger(
        level: AppConfig.LOG_LEVEL,
        printer: SimplePrinter(),
      );
      if (AppConfig.LOG_LEVEL == Level.verbose) {
        dio.interceptors.add(LogInterceptor(logPrint: _logger.v, requestBody: true, responseBody: true));
      } else {
        dio.interceptors.add(LogInterceptor(logPrint: _logger.d));
      }
    }

    dio.interceptors.add(InterceptorsWrapper(onRequest: _onRequest, onError: _onError, onResponse: _onResponse));
  }

  Future<RequestOptions> _onRequest(RequestOptions option) async {
    final String accessToken = await locator<AuthManager>().getAccessToken();
    if (accessToken != null) {
      option.headers["Authorization"] = "Bearer $accessToken";
    }

    option.headers["Accept"] = "application/json";

    return option;
  }

  dynamic _onResponse(Response response) {
    if(response.data is Map) {
      final responseData = response.data as Map;
      final isSuccess = responseData["isSuccess"] as bool;
      if(isSuccess == false) {
        throw DioError(response: response);
      }
    }
    return response.data;
  }

  HttpError _onError(DioError e) {
    final HttpError httpError = HttpError(e);

    if (httpError.response?.statusCode == HttpStatus.unauthorized) {
      logger.w("Http Unauthorized Response");
      eventBus.fire(HttpUnauthorizedResponseEvent(httpError));
    }

    return httpError;
  }
}
