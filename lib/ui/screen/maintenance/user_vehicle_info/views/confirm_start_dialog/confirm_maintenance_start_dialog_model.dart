import 'package:injectable/injectable.dart';
import 'package:staff_maintenance_app/backend/services/maintenance_service.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/sparepart_check/sparepart_check_screen.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/user_vehicle_info/views/confirm_start_dialog/confirm_maintenance_start_dialog.dart';

@injectable
class ConfirmMaintenanceStartDialogModel extends BaseViewModel<ConfirmMaintenanceStartDialog> {
  static const flowId = 1002;
  int maintenanceId;

  final MaintenanceService maintenanceService;

  ConfirmMaintenanceStartDialogModel(this.maintenanceService);

  Future onConfirm() {
    return call(() async {
      //var result = (await maintenanceService.startMaintenance(maintenanceId: maintenanceId)).data;
      SparepartCheckScreen.start(maintenanceId: maintenanceId); //result.id,));
    }, toastOnError: true, background: false);
  }
}