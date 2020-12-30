import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_maintenance_app/backend/services/branch_service.dart';
import 'package:staff_maintenance_app/backend/services/maintenance_service.dart';
import 'package:staff_maintenance_app/backend/services/vehicle_service.dart';
import 'package:staff_maintenance_app/models/branch/service.dart';
import 'package:staff_maintenance_app/models/maintenance/bill_detail.dart';
import 'package:staff_maintenance_app/models/maintenance/maintenance.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/schedule/maintenance_schedule_screen.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/service/maintenance_service_screen.dart';

@injectable
class MaintenanceServiceScreenModel extends BaseViewModel<MaintenanceServiceScreen> {
  int maintenanceId;

  final _maintenance = Rx<Maintenance>(null);
  final _service = RxList<Service>(null);

  Maintenance get maintenance => _maintenance.value;

  List<Service> get services => _service.value;
  List<BillDetail> get maintenanceBillDetail => _maintenance.value?.maintenanceBillDetail ?? [];

  final MaintenanceService maintenanceService;
  final VehicleService vehicleService;
  final BranchService branchService;

  MaintenanceServiceScreenModel(this.maintenanceService, this.vehicleService, this.branchService);

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    call(() async {
      await _loadMaintenance();
      await _loadBranchService();
    }, toastOnError: true, background: false);
  }

  Future _loadMaintenance() async {
    _maintenance.value = (await maintenanceService.getMaintenance(maintenanceId: maintenanceId)).data;
  }

  Future _loadBranchService() async {
    _service.value =
        (await branchService.getBranchServices(branchId: maintenance.branch.id, vehicleGroupId: maintenance.userVehicle.vehicleGroupId)).data;
  }

  void onConfirm() {
    MaintenanceScheduleScreen.start(maintenanceId: maintenanceId);
  }

  void onAddService(int serviceId, int quantity) {
    var params = <String, dynamic> {
      "quantity": quantity,
      "branchServicePriceId": serviceId,
    };

    call(() async {
      await maintenanceService.addBill(maintenanceId: maintenanceId, params: params);
      loadData();
    }, toastOnError: true, background: false);
  }
}
