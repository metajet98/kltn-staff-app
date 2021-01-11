import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_maintenance_app/backend/services/maintenance_service.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/models/maintenance/maintenance.dart';
import 'package:staff_maintenance_app/storage/user_storage.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';
import 'package:staff_maintenance_app/ui/screen/history/history_screen.dart';

@injectable
class HistoryScreenModel extends BaseViewModel<HistoryScreen> {
  final MaintenanceService maintenanceService;

  HistoryScreenModel(this.maintenanceService);

  final _histories = RxList<Maintenance>();

  List<Maintenance> get histories => _histories.value;

  @override
  void onInit() {
    loadHistory();
    super.onInit();
  }

  Future loadHistory({bool showLoading = true}) async {
    call(() async {
      var staffId = locator<UserIdStorage>().get();
      _histories.value = (await maintenanceService.getAllMaintenance(staffId: staffId)).data;
    }, toastOnError: true, background: !showLoading);
  }
}