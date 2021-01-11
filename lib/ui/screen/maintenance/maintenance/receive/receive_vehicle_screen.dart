import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/constaints/constaints.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/maintenance/receive/receive_vehicle_screen_model.dart';

class ReceiveVehicleScreen extends BaseView<ReceiveVehicleScreenModel> {
  static void start({int userVehicleId}) => Get.to(ReceiveVehicleScreen(userVehicleId: userVehicleId));

  ReceiveVehicleScreen({int userVehicleId}) {
    viewModel.userVehicleId = userVehicleId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          "Tiếp nhận xe",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Tiêu đề"),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        viewModel.title = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Bảo dưỡng định kì",
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(gapPadding: 0, borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Rửa xe: "),
                  Spacer(),
                  Obx(
                    () => Radio(
                      value: motorWashBefore,
                      groupValue: viewModel.motorWash,
                      onChanged: (value) {
                        viewModel.motorWash = value;
                      },
                    ),
                  ),
                  Text("Trước"),
                  Obx(
                    () => Radio(
                      value: motorWashAfter,
                      groupValue: viewModel.motorWash,
                      onChanged: (value) {
                        viewModel.motorWash = value;
                      },
                    ),
                  ),
                  Text("Sau"),
                  Obx(
                    () => Radio(
                      value: motorWashNon,
                      groupValue: viewModel.motorWash,
                      onChanged: (value) {
                        viewModel.motorWash = value;
                      },
                    ),
                  ),
                  Text("Không"),
                ],
              ),
              Row(
                children: [
                  Text("Khách lấy lại phụ tùng: "),
                  Spacer(),
                  Obx(
                    () => Radio(
                      value: true,
                      groupValue: viewModel.sparepartBack,
                      onChanged: (value) {
                        viewModel.sparepartBack = true;
                      },
                    ),
                  ),
                  Text("Có"),
                  Obx(
                    () => Radio(
                      value: false,
                      groupValue: viewModel.sparepartBack,
                      onChanged: (value) {
                        viewModel.sparepartBack = false;
                      },
                    ),
                  ),
                  Text("Không"),
                ],
              ),
              Row(
                children: [
                  Text("Công tơ mét (Odo): "),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        viewModel.odometer = int.tryParse(value);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(gapPadding: 0, borderRadius: BorderRadius.circular(10)),
                          suffix: Text("Km")),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Text("Ghi chú thêm:"),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  viewModel.notes = value;
                },
                minLines: 3,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(gapPadding: 0, borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 16),
              Text("Hình ảnh:"),
              SizedBox(height: 8),
              Obx(
                () => Wrap(
                  children: _buildImageWidgets(),
                  spacing: 8,
                  runSpacing: 8,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () => viewModel.createMaintenance(),
                    child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Xác nhận",
                          style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    color: Colors.green,
                  ),
                  SizedBox(width: 16),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey),
                    ),
                    onPressed: () => Get.back(),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Huỷ",
                        style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildImageWidgets() {
    var result = <Widget>[];
    if (viewModel.images.isNotEmpty) {
      result.addAll(viewModel.images
          .map(
            (e) => Material(
              borderRadius: BorderRadius.circular(5),
              elevation: 5,
              child: SizedBox(
                width: 100,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    e,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
          .toList());
    }
    result.add(Material(
      borderRadius: BorderRadius.circular(50),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: viewModel.onAddImagePressed,
        child: Container(
          width: 50,
          height: 50,
          child: Icon(Icons.add, color: Colors.blueAccent),
        ),
      ),
    ));
    return result;
  }
}
