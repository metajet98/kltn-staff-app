import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/models/maintenance/sparepart_detail.dart';
import 'package:staff_maintenance_app/models/maintenance/status.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/sparepart_check/sparepart_check_screen_model.dart';

class SparepartCheckScreen extends BaseView<SparepartCheckScreenModel> {
  static String routeName = "/SparepartCheckScreen";

  static void start({int maintenanceId}) => Get.to(SparepartCheckScreen(maintenanceId: maintenanceId));

  SparepartCheckScreen({int maintenanceId}) {
    viewModel.maintenanceId = maintenanceId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          viewModel.startFlowAudio();
        },
        child: Icon(Icons.mic),
      ),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          "1. Kiểm tra phụ tùng",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {},
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Obx(() => _buildStatusHeader(viewModel.statuses)),
              Obx(() => Column(
                  children: viewModel.checkListItems?.map((e) => _buildCheckListItem(e, viewModel.currentPositionElement == e))?.toList() ?? [])),
              Obx(() => _buildStatusDescription(viewModel.statuses)),
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

  Widget _buildStatusHeader(List<Status> statuses) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: viewModel.statuses
                ?.map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19),
                    child: Text(e.acronym),
                  ),
                )
                ?.toList() ??
            []);
  }

  Widget _buildStatusDescription(List<Status> statuses) {
    return Text("Viết tắt: ${statuses?.map((e) => "${e.acronym}: ${e.name}")}");
  }

  Widget _buildCheckListItem(SparePartDetail checkItem, bool isOnProcess) {
    return Container(
      color: isOnProcess ? Colors.grey : Colors.white,
      child: Row(
        children: [
          Text(
            checkItem.sparePartItem.name,
            style: TextStyle(color: Colors.black),
          ),
          Spacer(),
          Row(
            children: viewModel.statuses
                .map(
                  (status) => Checkbox(
                    value: checkItem.statusId == status.id,
                    onChanged: (value) => viewModel.onValueChange(checkItem, status),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
