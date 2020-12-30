import 'package:get/get.dart';
import 'package:staff_maintenance_app/backend/auth_manager.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/history/history_screen.dart';
import 'package:staff_maintenance_app/ui/screen/main/main_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/input_user_vehicle/input_user_vehicle_screen.dart';
import 'package:staff_maintenance_app/ui/screen/profile/profile_screen.dart';

class MainScreen extends BaseView<MainScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.settings_sharp), onPressed: () => Get.to(InputUserVehicleScreen())),
      body: SafeArea(
        child: PageView(
          onPageChanged: viewModel.onPageViewSnap,
          physics: NeverScrollableScrollPhysics(),
          controller: viewModel.pageController,
          children: [
            HistoryScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: viewModel.selectedIndex,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.blueAccent),
            unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
            type: BottomNavigationBarType.fixed,
            elevation: 5,
            onTap: viewModel.onBottomNavSelect,
            items: [
              BottomNavigationBarItem(
                label: "Lich sử bảo dưỡng",
                icon: Icon(FontAwesome.history),
              ),
              BottomNavigationBarItem(
                label: "Tài khoản",
                icon: Icon(FontAwesome.user),
              ),
            ],
          )),
    );
  }
}
