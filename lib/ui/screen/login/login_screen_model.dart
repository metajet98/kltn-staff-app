import 'package:staff_maintenance_app/backend/auth_manager.dart';
import 'package:staff_maintenance_app/backend/services/user_service.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/storage/user_storage.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';
import 'package:staff_maintenance_app/ui/screen/login/login_screen.dart';
import 'package:staff_maintenance_app/ui/screen/main/main_screen.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:staff_maintenance_app/extensions/context_ext.dart';

@injectable
class LoginScreenModel extends BaseViewModel<LoginScreen> {

  final UserService userService;

  LoginScreenModel(this.userService);

  Future onLogin(String phoneNumber, String password) async {
    Get.context.hideKeyboard();
    return call(() async {
      await locator<AuthManager>().login(phoneNumber, password);
      var userId = (await userService.self()).data.id;
      locator<UserIdStorage>().set(userId);
      Get.offAll(MainScreen());
    }, background: false, toastOnError: true);
  }
}
