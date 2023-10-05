import 'package:budget_buddie/Screens/Registration/VerifyEmailScreen/verify_email_controller.dart';
import 'package:get/get.dart';

class VerifyEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyEmailController>(() => VerifyEmailController());
  }
}
