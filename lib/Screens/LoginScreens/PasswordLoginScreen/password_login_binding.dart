import 'package:budget_buddie/Screens/LoginScreens/PasswordLoginScreen/password_login_controller.dart';
import 'package:get/get.dart';

class PasswordLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordLoginController>(() => PasswordLoginController());
    // TODO: implement dependencies
  }
}
