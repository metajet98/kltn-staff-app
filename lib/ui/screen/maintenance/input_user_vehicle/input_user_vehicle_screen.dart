import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/input_user_vehicle/input_user_vehicle_screen_model.dart';

class InputUserVehicleScreen extends BaseView<InputUserVehicleScreenModel> {
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tìm xe",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: inputController,
              decoration: InputDecoration(
                  labelText: "Biển số xe",
                  hintText: "Nhập biển số xe",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey))),
            ),
            SizedBox(height: 16),
            FlatButton(
              onPressed: () {
                viewModel.findUserVehicle(inputController.text);
              },
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Tìm xe",
                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
