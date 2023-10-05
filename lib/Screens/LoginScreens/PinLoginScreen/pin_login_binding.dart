import 'package:budget_buddie/Screens/LoginScreens/PinLoginScreen/pin_login_controller.dart';
import 'package:get/get.dart';

class PinLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinLoginController>(() => PinLoginController());
  }
}
