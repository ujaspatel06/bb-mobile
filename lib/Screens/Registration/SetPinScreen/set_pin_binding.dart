import 'package:budget_buddie/Screens/Registration/SetPinScreen/set_pin_controller.dart';
import 'package:get/get.dart';

class SetPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetPinController>(() => SetPinController());
  }
}
