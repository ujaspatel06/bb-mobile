import 'package:budget_buddie/Screens/Registration/GetStartedScreen/get_started_controller.dart';
import 'package:get/get.dart';

class GetStartedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetStartedController>(() => GetStartedController());
  }
}
