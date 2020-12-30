import 'package:staff_maintenance_app/backend/http_client.dart';
import 'package:staff_maintenance_app/configs/backend_config.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'fcm_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api/fcm")
abstract class FcmService {
  @factoryMethod
  factory FcmService() => _FcmService(locator<HttpClient>().dio);

  @POST("/register")
  Future<void> register({@Field("token") String token, @Field("platform") String platform});

  @POST("/unregister")
  Future<void> unregister({@Field("token") String token});
}
