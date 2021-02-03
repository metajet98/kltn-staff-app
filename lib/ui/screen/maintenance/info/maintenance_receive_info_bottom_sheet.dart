import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/constaints/constaints.dart';
import 'package:staff_maintenance_app/generated/assets.gen.dart';
import 'package:staff_maintenance_app/helpers/format_helper.dart';
import 'package:staff_maintenance_app/models/maintenance/maintenance.dart';

class MaintenanceReceiveInfoBottomSheet extends StatelessWidget {


  final Maintenance maintenance;

  const MaintenanceReceiveInfoBottomSheet({Key key, this.maintenance}) : super(key: key);

  static void show(Maintenance maintenance) => Get.bottomSheet(MaintenanceReceiveInfoBottomSheet(maintenance: maintenance), isScrollControlled: true);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 48),
            child: Material(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
              elevation: 5,
              child: Container(
                padding: EdgeInsets.only(top: 48, right: 16, left: 16, bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      maintenance.title ?? "Bảo dưỡng định kì",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 32),
                    _buildInfoRow("Mã lượt bảo dưỡng", "${maintenance.id}"),
                    _buildInfoRow("Chủ xe", "${maintenance.userVehicle.user?.fullName}"),
                    _buildInfoRow("Odometer", "${maintenance.odometer} km"),
                    _buildInfoRow("Thời gian nhận xe", FormatHelper.formatDateTime(maintenance.createdDate)),
                    _buildInfoRow("Nhân viên nhận xe", maintenance.receptionStaff?.fullName),
                    _buildInfoRow("Nhân viên bảo dưỡng", maintenance.maintenanceStaff?.fullName),
                    _buildInfoRow("Rửa xe", getWashText(maintenance.motorWash)),
                    _buildInfoRow("Lấy lại phụ tùng", maintenance.sparepartBack ? "Có" : "Không"),
                    _buildInfoRow("Ghi chú", maintenance.notes),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Material(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              color: Colors.white,
              child: ClipRRect(
                child: Container(
                  width: 96,
                  height: 96,
                  child: Hero(
                    tag: "ic_logo",
                    child: Assets.resources.images.icLogo.image(fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String info) => Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey))
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title ?? ""),
        SizedBox(width: 8),
        Flexible(child: Text(info ?? ""))
      ],
    ),
  );

  String getWashText(int washId) {
    switch(washId) {
      case motorWashBefore: return "Trước";
      case motorWashAfter: return "Sau";
      case motorWashNon: return "Không";
      default: return "";
    }
  }
 }

