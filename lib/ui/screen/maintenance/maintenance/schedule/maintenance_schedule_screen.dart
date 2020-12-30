import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/constaints/constaints.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/schedule/maintenance_schedule_screen_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/schedule/views/add_schedule_bottom_sheet.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/schedule/views/schedule_view.dart';
import 'package:staff_maintenance_app/ui/shared/list_view/easy_listview.dart';

class MaintenanceScheduleScreen extends BaseView<MaintenanceScheduleScreenModel> {
  static void start({int maintenanceId}) => Get.to(MaintenanceScheduleScreen(maintenanceId: maintenanceId));

  MaintenanceScheduleScreen({int maintenanceId}) {
    viewModel.maintenanceId = maintenanceId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.bottomSheet(
            AddScheduleBottomSheet(
                onConfirm: (title, content, date, odo) => viewModel.onAddSchedule(title: title, content: content, odo: odo, date: date)),
            isScrollControlled: true),
      ),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          "3 Lịch hẹn",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {},
        child: Column(
          children: [
            Obx(
              () => Flexible(
                child: EasyListView(
                  shrinkWrap: true,
                  itemCount: viewModel.schedules.length,
                  padding: EdgeInsets.all(16),
                  itemBuilder: (ctx, index) => ScheduleView(
                    schedule: viewModel.schedules[index],
                  ),
                  dividerBuilder: (ctx, index) => SizedBox(height: 16),
                ),
              ),
            ),
            SizedBox(height: 16),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () => viewModel.onConfirm(),
              child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Hoàn tất",
                    style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
