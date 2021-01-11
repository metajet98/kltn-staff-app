import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_maintenance_app/backend/services/maintenance_service.dart';
import 'package:staff_maintenance_app/backend/services/vehicle_service.dart';
import 'package:staff_maintenance_app/models/maintenance/maintenance.dart';
import 'package:staff_maintenance_app/models/maintenance/sparepart_detail.dart';
import 'package:staff_maintenance_app/models/maintenance/sparepart_item.dart';
import 'package:staff_maintenance_app/models/maintenance/status.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/service/maintenance_service_screen.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/sparepart_check/sparepart_check_screen.dart';

@injectable
class SparepartCheckScreenModel extends BaseViewModel<SparepartCheckScreen> {
  int maintenanceId;

  final _maintenance = Rx<Maintenance>(null);
  final _sparePartItems = RxList<SparePartItem>(null);
  final _statuses = RxList<Status>(null);
  final _checkListItems = RxList<SparePartDetail>(null);

  Maintenance get maintenance => _maintenance.value;

  List<Status> get statuses => _statuses.value;

  List<SparePartDetail> get checkListItems => _checkListItems.value;

  final MaintenanceService maintenanceService;
  final VehicleService vehicleService;

  SparepartCheckScreenModel(this.maintenanceService, this.vehicleService);

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    call(() async {
      await _loadMaintenance();
      await _loadSparepartCheckList();
      await _loadStatuses();
      generateCheckListItems();
    }, toastOnError: true, background: false);
  }

  Future _loadMaintenance() async {
    _maintenance.value = (await maintenanceService.getMaintenance(maintenanceId: maintenanceId)).data;
  }

  Future _loadSparepartCheckList() async {
    _sparePartItems.value = (await vehicleService.getVehicleSpareParts(maintenance.userVehicle.vehicleGroupId)).data;
  }

  Future _loadStatuses() async {
    _statuses.value = (await vehicleService.getStatuses()).data;
  }

  void generateCheckListItems() {
    if (maintenance == null || statuses == null || _sparePartItems.value == null) return;
    var result = List<SparePartDetail>.from(maintenance.sparePartCheckDetail);
    _sparePartItems.value.forEach((checkItem) {
      if (!result.any((element) => element.sparePartItemId == checkItem.id)) {
        result.add(
            SparePartDetail(maintenanceId: maintenanceId, sparePartItem: checkItem, sparePartItemId: checkItem.id));
      }
    });
    _checkListItems.value = result;
  }

  void onValueChange(SparePartDetail item, Status newStatus) {
    item.status = newStatus;
    item.statusId = newStatus.id;
    _checkListItems.refresh();
  }

  void onConfirm() {
    var checkList = List<Map<String, dynamic>>();
    checkListItems.forEach((element) {
      if(element.status == null) return;
      checkList.add(<String, dynamic> {
        "StatusId" : element.statusId,
        "VehicleSparePartId": element.sparePartItem.id
      });
    });
    var params = <String, dynamic> {
      "SparePartMaintenanceChecks" : checkList,
    };
    print(params);

    call(() async {
      final result = await maintenanceService.updateCheckList(maintenanceId: maintenanceId, params: params);
      MaintenanceServiceScreen.start(maintenanceId: maintenanceId);
    }, background: false, toastOnError: true);
  }
}
