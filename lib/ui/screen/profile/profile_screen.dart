import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/profile/profile_screen_model.dart';

class ProfileScreen extends BaseView<ProfileScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thông tin nhân viên",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.logout, color: Colors.red,), onPressed: viewModel.logout)
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Obx(() => Text("Tên nhân viên: ${viewModel.profile?.fullName ?? ""}")),
                  SizedBox(height: 8),
                  Obx(() => Text("Số điện thoại: ${viewModel.profile?.phoneNumber ?? ""}")),
                  SizedBox(height: 8),
                  Obx(() => Text("Địa chỉ: ${viewModel.profile?.address ?? ""}")),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  @override
  BaseViewState<ProfileScreenModel> createState() => ProfileScreenState();
}

class ProfileScreenState extends BaseViewState<ProfileScreenModel> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  bool get wantKeepAlive => true;
}
