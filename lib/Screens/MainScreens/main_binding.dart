import 'package:budget_buddie/Screens/MainScreens/main_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());

    // TODO: implement dependencies
  }
}
