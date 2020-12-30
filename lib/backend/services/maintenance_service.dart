import 'package:staff_maintenance_app/backend/http_client.dart';
import 'package:staff_maintenance_app/backend/responses/array_response.dart';
import 'package:staff_maintenance_app/backend/responses/object_response.dart';
import 'package:staff_maintenance_app/configs/backend_config.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/models/maintenance/maintenance.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'maintenance_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api/maintenance")
abstract class MaintenanceService {
  @factoryMethod
  factory MaintenanceService() => _MaintenanceService(locator<HttpClient>().dio);

  @GET("")
  Future<ArrayResponse<Maintenance>> getAllMaintenance({@Query("userVehicleId") int userVehicleId});

  @GET("/{maintenanceId}")
  Future<ObjectResponse<Maintenance>> getMaintenance({@Path("maintenanceId") int maintenanceId});

  @POST("")
  Future<ObjectResponse<Maintenance>> createMaintenance({@Body() Map<String, dynamic> params});

  @POST("/{maintenanceId}/start")
  Future<ObjectResponse<Maintenance>> startMaintenance({@Path("maintenanceId") int maintenanceId});

  @POST("/{maintenanceId}/finish")
  Future<ObjectResponse<void>> finishMaintenance({@Path("maintenanceId") int maintenanceId});

  @POST("/{maintenanceId}/check")
  Future<ObjectResponse<void>> updateCheckList({@Path("maintenanceId") int maintenanceId, @Body() Map<String, dynamic> params});

  @POST("/{maintenanceId}/bill")
  Future<ObjectResponse<void>> addBill({@Path("maintenanceId") int maintenanceId, @Body() Map<String, dynamic> params});

  @POST("/{maintenanceId}/schedule")
  Future<ObjectResponse<void>> addSchedule({@Path("maintenanceId") int maintenanceId, @Body() Map<String, dynamic> params});
}
