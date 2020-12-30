import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_maintenance_app/backend/services/branch_service.dart';
import 'package:staff_maintenance_app/backend/services/maintenance_service.dart';
import 'package:staff_maintenance_app/backend/services/vehicle_service.dart';
import 'package:staff_maintenance_app/helpers/navigator_helper.dart';
import 'package:staff_maintenance_app/models/branch/service.dart';
import 'package:staff_maintenance_app/models/maintenance/bill_detail.dart';
import 'package:staff_maintenance_app/models/maintenance/maintenance.dart';
import 'package:staff_maintenance_app/models/maintenance/schedule.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/schedule/maintenance_schedule_screen.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/service/maintenance_service_screen.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/sparepart_check/sparepart_check_screen.dart';

@injectable
class MaintenanceScheduleScreenModel extends BaseViewModel<MaintenanceScheduleScreen> {
  int maintenanceId;

  final _maintenance = Rx<Maintenance>(null);

  Maintenance get maintenance => _maintenance.value;

  List<Schedule> get schedules => _maintenance.value?.maintenanceSchedule ?? [];

  final MaintenanceService maintenanceService;

  MaintenanceScheduleScreenModel(this.maintenanceService);

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    call(() async {
      await _loadMaintenance();
    }, toastOnError: true, background: false);
  }

  Future _loadMaintenance() async {
    _maintenance.value = (await maintenanceService.getMaintenance(maintenanceId: maintenanceId)).data;
  }

  void onConfirm() {
    call(() async {
      await maintenanceService.finishMaintenance(maintenanceId: maintenanceId);
      NavigatorHelper.popAllFrom(SparepartCheckScreen.routeName);
    }, toastOnError: true);
  }

  void onAddSchedule({String title, String content, int odo, DateTime date}) {
    var params = <String, dynamic> {
      "Date": date.toIso8601String(),
      "Odometer": odo,
      "Title": title,
      "Content": content,
    };

    print(params);

    call(() async {
      await maintenanceService.addSchedule(maintenanceId: maintenanceId, params: params);
      loadData();
    }, toastOnError: true, background: false);
  }
}
