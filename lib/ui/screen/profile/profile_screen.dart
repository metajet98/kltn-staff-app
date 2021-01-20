import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              onPressed: viewModel.logout)
        ],
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => viewModel.loadUser(showLoading: false),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInfoRow(Obx(() => Text("Mã nhân viên: ${viewModel.profile?.id ?? ""}")), FontAwesome.user),
              SizedBox(height: 8),
              _buildInfoRow(Obx(() => Text("Họ và tên: ${viewModel.profile?.fullName ?? ""}")), Icons.book),
              SizedBox(height: 8),
              _buildInfoRow(Obx(() => Text("Số điện thoại: ${viewModel.profile?.phoneNumber ?? ""}")), Icons.phone),
              SizedBox(height: 8),
              _buildInfoRow(Obx(() => Text("Địa chỉ: ${viewModel.profile?.address ?? ""}", overflow: TextOverflow.ellipsis)), Icons.home),
              SizedBox(height: 8),
              _buildInfoRow(Obx(() => Text("Chi nhánh: ${viewModel.profile?.branch?.name ?? ""}")), Icons.map),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(Widget child, IconData icon) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueAccent,),
            SizedBox(width: 8),
            Expanded(child: child),
          ],
        ),
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
