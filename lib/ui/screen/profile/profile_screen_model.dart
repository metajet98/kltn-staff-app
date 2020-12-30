import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_maintenance_app/backend/auth_manager.dart';
import 'package:staff_maintenance_app/backend/services/user_service.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/models/user/user.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';
import 'package:staff_maintenance_app/ui/screen/profile/profile_screen.dart';

@injectable
class ProfileScreenModel extends BaseViewModel<ProfileScreen> {
  final _profile = Rx<User>();
  User get profile => _profile.value;

  final UserService userService;

  ProfileScreenModel(this.userService);

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  Future loadUser() async {
    _profile.value = (await userService.self()).data;
  }

  void logout() {
    locator<AuthManager>().logout();
  }
}