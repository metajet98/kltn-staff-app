import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/generated/assets.gen.dart';
import 'package:staff_maintenance_app/helpers/format_helper.dart';
import 'package:staff_maintenance_app/models/branch/service.dart';
import 'package:staff_maintenance_app/models/vehicle/vehicle.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/user_vehicle_info/user_vehicle_detail_screen.dart';

class AddServiceBottomSheet extends StatefulWidget {
  final List<Service> services;
  final Function(int, int) onConfirm;

  const AddServiceBottomSheet({Key key, this.services, this.onConfirm}) : super(key: key);

  @override
  _AddServiceBottomSheetState createState() => _AddServiceBottomSheetState();
}

class _AddServiceBottomSheetState extends State<AddServiceBottomSheet> {

  final selectedService = Rx<Service>();
  int quantity;

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
                      "Thêm dịch vụ",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<Service>(
                            decoration: const InputDecoration(
                              labelText: "Chọn dịch vụ",
                              border: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                                gapPadding: 0,
                              ),
                            ),
                            items: widget.services.map((service) {
                              return new DropdownMenuItem<Service>(
                                value: service,
                                child: new Text(service.name),
                              );
                            }).toList(),
                            onChanged: (service) {
                              selectedService.value = service;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        quantity = int.tryParse(text);
                      },
                      decoration: InputDecoration(
                        labelText: "Số lượng",
                        border: new OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: const BorderRadius.all(const Radius.circular(20)),
                        ),
                        hintText: "Nhập số lượng",
                        hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(height: 16),
                    Obx(() => serviceInfo(selectedService.value)),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            widget.onConfirm(selectedService.value?.id, quantity);
                            Get.back();
                          },
                          child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "Thêm dịch vụ",
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

  Widget serviceInfo(Service service) {
    if(service == null) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tên dịch vụ: ${service.name}"),
        Text("Giá phụ tùng: ${FormatHelper.formatMoney(service.sparePartPrice ?? 0)}"),
        Text("Giá nhân công: ${FormatHelper.formatMoney(service.laborCost ?? 0)}"),
        if(service.warrantyPeriod != null)
          Text("Thời gian bảo hành (tháng): ${service.warrantyPeriod ?? 0}"),
        if(service.warrantyPeriod != null)
          Text("Số km bảo hành: ${service.warrantyOdo ?? 0}"),
      ],
    );
  }
}
