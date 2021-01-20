import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/service/maintenance_service_screen_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/service/views/add_service_bottom_sheet.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/service/views/bill_table_view.dart';

class MaintenanceServiceScreen extends BaseView<MaintenanceServiceScreenModel> {
  static void start({int maintenanceId}) => Get.to(MaintenanceServiceScreen(maintenanceId: maintenanceId));

  MaintenanceServiceScreen({int maintenanceId}) {
    viewModel.maintenanceId = maintenanceId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => Get.bottomSheet(
          AddServiceBottomSheet(
            onConfirm: (serviceId, quantity) => viewModel.onAddService(serviceId, quantity),
            services: viewModel.services,
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          "2. Dịch vụ",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => viewModel.loadData(showLoading: false),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Obx(() => BillTableView(
                    billDetails: viewModel.maintenanceBillDetail,
                  )),
              SizedBox(height: 16),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () => viewModel.onConfirm(),
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Tiếp tục",
                      style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
