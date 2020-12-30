import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/backend/services/maintenance_service.dart';
import 'package:staff_maintenance_app/backend/services/vehicle_service.dart';
import 'package:staff_maintenance_app/event_bus.dart';
import 'package:staff_maintenance_app/events/event_maintenance_created.dart';
import 'package:staff_maintenance_app/models/maintenance/maintenance.dart';
import 'package:staff_maintenance_app/models/vehicle/vehicle.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/user_vehicle_info/user_vehicle_detail_screen.dart';

@injectable
class UserVehicleDetailScreenModel extends BaseViewModel<UserVehicleDetailScreen> {
  int userVehicleId;

  final VehicleService vehicleService;
  final MaintenanceService maintenanceService;

  final _userVehicle = Rx<Vehicle>();
  final _maintenances = RxList<Maintenance>();

  Vehicle get userVehicle => _userVehicle.value;
  List<Maintenance> get maintenances => _maintenances.value;

  UserVehicleDetailScreenModel(this.vehicleService, this.maintenanceService);

  StreamSubscription onMaintenanceCreated;

  @override
  void onInit() {
    loadData();
    onMaintenanceCreated = eventBus.on<EventMaintenanceCreated>().listen((event) {
      loadData(showLoading: false);
    });
    super.onInit();
  }

  @override
  void onDispose() {
    onMaintenanceCreated?.cancel();
    super.onDispose();
  }

  Future loadData({bool showLoading = true}) {
    return call(() async {
      _userVehicle.value = (await vehicleService.getUserVehicle(userVehicleId)).data;
      _maintenances.assignAll((await maintenanceService.getAllMaintenance(userVehicleId: userVehicleId)).data);
    }, background: !showLoading, toastOnError: true);
  }
}
