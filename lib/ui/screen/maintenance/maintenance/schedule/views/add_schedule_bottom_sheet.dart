import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/generated/assets.gen.dart';

class AddScheduleBottomSheet extends StatefulWidget {
  final Function(String title, String content, DateTime date, int odo) onConfirm;

  const AddScheduleBottomSheet({Key key, this.onConfirm}) : super(key: key);

  @override
  _AddScheduleBottomSheetState createState() => _AddScheduleBottomSheetState();
}

class _AddScheduleBottomSheetState extends State<AddScheduleBottomSheet> {
  DateTime date;
  int odo;
  String title;
  String content;

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
                      "Thêm lịch hẹn",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 32),
                    TextField(
                      onChanged: (text) {
                        title = text;
                      },
                      decoration: InputDecoration(
                          labelText: "Tiêu đề",
                          border: new OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: const BorderRadius.all(const Radius.circular(20)),
                          ),
                          hintText: "Nhập tiêu đề",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      minLines: 2,
                      maxLines: 4,
                      onChanged: (text) {
                        content = text;
                      },
                      decoration: InputDecoration(
                          labelText: "Nội dung",
                          border: new OutlineInputBorder(
                            gapPadding: 0,
                            borderRadius: const BorderRadius.all(const Radius.circular(20)),
                          ),
                          hintText: "Nhập nội dung",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: DateTimePicker(
                            type: DateTimePickerType.date,
                            dateMask: "dd/MM/yyyy",
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                            onChanged: (value) {
                              date = DateTime.tryParse(value);
                            },
                            decoration: InputDecoration(
                              labelText: "Ngày hẹn",
                              border: new OutlineInputBorder(
                                gapPadding: 0,
                                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                              ),
                              hintText: "Nhập ngày hẹn",
                              hintStyle: TextStyle(color: Colors.grey)),
                          )
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            onChanged: (text) {
                              odo = int.tryParse(text);
                            },
                            decoration: InputDecoration(
                                labelText: "Odometer",
                                border: new OutlineInputBorder(
                                  gapPadding: 0,
                                  borderRadius: const BorderRadius.all(const Radius.circular(20)),
                                ),
                                hintText: "Nhập Odometer",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            widget.onConfirm(title, content, date, odo);
                            Get.back();
                          },
                          child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                "Tạo",
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
