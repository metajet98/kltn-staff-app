import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/generated/assets.gen.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/input_user_vehicle/input_user_vehicle_bottom_sheet_model.dart';

class InputUserVehicleBottomSheet extends BaseView<InputUserVehicleBottomSheetModel> {
  final inputController = TextEditingController();

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
                      "Tìm xe",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 32),
                    TextField(
                      controller: inputController,
                      decoration: InputDecoration(
                        labelText: "Biển số xe",
                        hintText: "Nhập biển số xe",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey))),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            viewModel.findUserVehicle(inputController.text);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Tìm",
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
