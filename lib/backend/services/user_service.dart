import 'package:staff_maintenance_app/backend/http_client.dart';
import 'package:staff_maintenance_app/backend/responses/object_response.dart';
import 'package:staff_maintenance_app/configs/backend_config.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/models/user/user.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'user_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api/user")
abstract class UserService {
  @factoryMethod
  factory UserService() => _UserService(locator<HttpClient>().dio);

  @GET("/self")
  Future<ObjectResponse<User>> self();

  @POST("")
  Future<void> createAccount({@Field("PhoneNumber") String phoneNumber, @Field("Password") String password, @Field("FullName") String fullName});
}
