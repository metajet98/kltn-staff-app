import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/receive/receive_vehicle_screen.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/user_vehicle_info/user_vehicle_detail_screen_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/user_vehicle_info/views/maintenance_history_item_view.dart';
import 'package:staff_maintenance_app/ui/shared/list_view/easy_listview.dart';

class UserVehicleDetailScreen extends BaseView<UserVehicleDetailScreenModel> {
  UserVehicleDetailScreen({int userVehicleId}) {
    print(userVehicleId);
    viewModel.userVehicleId = userVehicleId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Obx(() => Text(
              viewModel.userVehicle?.name ?? viewModel.userVehicle?.vehicleGroup?.name ?? "Thông tin xe khách hàng",
              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
            )),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Thông số",
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Obx(
                      () => Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            viewModel.userVehicle?.vehicleGroup?.image ?? "",
                            width: Get.width / 2 - 64,
                            height: Get.width / 2 - 64,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 32),
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dòng xe: ${viewModel.userVehicle?.vehicleGroup?.name ?? ""}"),
                          SizedBox(height: 4),
                          Text("Màu: ${viewModel.userVehicle?.color ?? ""}"),
                          SizedBox(height: 2),
                          Text("Biển số: ${viewModel.userVehicle?.plateNumber ?? ""}"),
                          SizedBox(height: 2),
                          Text("Số khung: ${viewModel.userVehicle?.chassisNumber ?? ""}"),
                          SizedBox(height: 2),
                          Text("Số máy: ${viewModel.userVehicle?.engineNumber ?? ""}"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(FontAwesome.history),
                    SizedBox(width: 4),
                    Text(
                      "Lịch sử bảo dưỡng",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Spacer(),
                    FlatButton(
                      onPressed: () => ReceiveVehicleScreen.start(userVehicleId: viewModel.userVehicleId),
                      padding: EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Tiếp nhận xe bảo dưỡng", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => Expanded(
              child: RefreshIndicator(
                onRefresh: () => viewModel.loadData(showLoading: false),
                child: EasyListView(
                  padding: EdgeInsets.all(16),
                  itemCount: viewModel.maintenances?.length ?? 0,
                  itemBuilder: (ctx, index) => MaintenanceHistoryItemView(maintenance: viewModel.maintenances[index]),
                  dividerBuilder: (ctx, index) => SizedBox(height: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
