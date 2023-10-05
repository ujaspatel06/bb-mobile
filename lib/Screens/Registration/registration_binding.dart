import 'package:budget_buddie/Screens/Registration/registration_controller.dart';
import 'package:get/get.dart';

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() => RegistrationController());
  }
}
