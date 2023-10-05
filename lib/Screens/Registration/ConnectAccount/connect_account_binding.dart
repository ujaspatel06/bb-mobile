import 'package:budget_buddie/Screens/Registration/ConnectAccount/connect_account_controller.dart';
import 'package:get/get.dart';

class ConnectAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectAccountController>(() => ConnectAccountController());
  }
}
