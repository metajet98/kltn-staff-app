import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/constaints/constaints.dart';
import 'package:staff_maintenance_app/helpers/format_helper.dart';
import 'package:staff_maintenance_app/models/maintenance/maintenance.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/user_vehicle_info/views/confirm_start_dialog/confirm_maintenance_start_dialog.dart';

class MaintenanceHistoryItemView extends StatelessWidget {
  final Maintenance maintenance;
  final bool isHistory;

  const MaintenanceHistoryItemView({Key key, this.maintenance, this.isHistory = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          if (maintenance.status == maintenanceCreated || maintenance.status == underMaintenance) {
            Get.dialog(ConfirmMaintenanceStartDialog(
              maintenance: maintenance,
            ));
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maintenance.title ?? "Bảo dưỡng định kì",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              isHistory ? Text("Biển số: ${maintenance?.userVehicle?.plateNumber}") : Text(maintenance.branch?.name),
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    FormatHelper.formatDateTime(maintenance.createdDate),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    "Trạng thái: ",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  _buildStatusText(maintenance.status)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildStatusText(int status) {
    switch (status) {
      case maintenanceCreated:
        {
          return Text(
            "Mới nhận xe",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          );
        }
      case underMaintenance:
        {
          return Text(
            "Đang bảo dưỡng",
            style: TextStyle(fontSize: 12, color: Colors.red),
          );
        }
      case maintenanceFinish:
        {
          return Text(
            "Kết thúc",
            style: TextStyle(fontSize: 12, color: Colors.green),
          );
        }
    }
  }
}
