import 'package:staff_maintenance_app/backend/http_client.dart';
import 'package:staff_maintenance_app/backend/responses/array_response.dart';
import 'package:staff_maintenance_app/configs/backend_config.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/models/branch/service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'branch_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api/branch")
abstract class BranchService {
  @factoryMethod
  factory BranchService() => _BranchService(locator<HttpClient>().dio);

  @GET("/{branch_id}/price")
  Future<ArrayResponse<Service>> getBranchServices(
      {@Path("branch_id") int branchId, @Query("vehicleGroupId") int vehicleGroupId});
}
