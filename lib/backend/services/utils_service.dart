import 'dart:io';

import 'package:staff_maintenance_app/backend/http_client.dart';
import 'package:staff_maintenance_app/backend/responses/object_response.dart';
import 'package:staff_maintenance_app/configs/backend_config.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'utils_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api/utils")
abstract class UtilsService {
  @factoryMethod
  factory UtilsService() => _UtilsService(locator<HttpClient>().dio);

  @POST("/image")
  Future<ObjectResponse<dynamic>> uploadImage({@Part(name: "file") File file});
}
