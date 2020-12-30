import 'package:staff_maintenance_app/backend/http_client.dart';
import 'package:staff_maintenance_app/backend/responses/array_response.dart';
import 'package:staff_maintenance_app/backend/responses/object_response.dart';
import 'package:staff_maintenance_app/configs/backend_config.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/models/maintenance/sparepart_item.dart';
import 'package:staff_maintenance_app/models/maintenance/status.dart';
import 'package:staff_maintenance_app/models/vehicle/vehicle.dart';
import 'package:staff_maintenance_app/models/vehicle/vehicle_company.dart';
import 'package:staff_maintenance_app/models/vehicle/vehicle_group.dart';
import 'package:staff_maintenance_app/models/vehicle/vehicle_type.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'vehicle_service.g.dart';

@lazySingleton
@RestApi(baseUrl: "${BackendConfig.BASE_URL}/api")
abstract class VehicleService {
  @factoryMethod
  factory VehicleService() => _VehicleService(locator<HttpClient>().dio);

  @GET("/vehicle-company")
  Future<ArrayResponse<VehicleCompany>> getVehicleCompanies();

  @GET("/vehicle-type")
  Future<ArrayResponse<VehicleType>> getVehicleTypes();

  @GET("/vehicle-group")
  Future<ArrayResponse<VehicleGroup>> getVehicleGroups();

  @POST("/user-vehicle")
  Future<ObjectResponse<void>> createUserVehicle({@Body() Map<String, dynamic> params});

  @GET("/user-vehicle")
  Future<ArrayResponse<Vehicle>> getUserVehicles({@Query("PlateNumber") String plateNumber});

  @GET("/user-vehicle/{id}")
  Future<ObjectResponse<Vehicle>> getUserVehicle(@Path("id") int id);

  @GET("/vehicle-group/{group_id}/spare-part")
  Future<ArrayResponse<SparePartItem>> getVehicleSpareParts(@Path("group_id") int groupId);

  @GET("/spare-part/status")
  Future<ArrayResponse<Status>> getStatuses();
}