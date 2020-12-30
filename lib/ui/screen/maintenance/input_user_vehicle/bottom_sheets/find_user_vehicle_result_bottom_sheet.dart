import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/generated/assets.gen.dart';
import 'package:staff_maintenance_app/models/vehicle/vehicle.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/user_vehicle_info/user_vehicle_detail_screen.dart';

class FindUserVehicleResultBottomSheet extends StatelessWidget {
  final Vehicle vehicle;

  const FindUserVehicleResultBottomSheet({Key key, this.vehicle}) : super(key: key);

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
                      "Tìm thấy xe trong hệ thống",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 32),
                    Text("Biển số: ${vehicle.plateNumber}"),
                    SizedBox(height: 8),
                    Text("Chủ xe: ${vehicle.user?.fullName ?? ""}"),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () => Get.to(UserVehicleDetailScreen(userVehicleId: vehicle.id)),
                          child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "Tiếp tục",
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
}
