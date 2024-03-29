import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/constaints/constaints.dart';
import 'package:staff_maintenance_app/models/maintenance/maintenance.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/user_vehicle_info/views/confirm_start_dialog/confirm_maintenance_start_dialog_model.dart';

class ConfirmMaintenanceStartDialog extends BaseView<ConfirmMaintenanceStartDialogModel> {
  ConfirmMaintenanceStartDialog({Maintenance maintenance}) {
    viewModel.maintenance = maintenance;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Xác nhận",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              getDialogMessage(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () => viewModel.onConfirm(),
                  child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Có",
                        style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  color: Colors.green,
                ),
                SizedBox(width: 16),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () => Get.back(),
                  child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Huỷ",
                        style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  String getDialogMessage() {
    switch(viewModel.maintenance.status) {
      case maintenanceCreated:
        return "Bạn có chắc chắn muốn bắt đầu tiến hành bản dưỡng?";
      case underMaintenance:
        return "Bạn có chắc chắn muốn tiếp tục tiến hành bản dưỡng?";
      default:
        return "";
  }
  }
}
