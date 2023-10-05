import 'package:budget_buddie/Screens/Registration/AddPayment/addpayment_controller.dart';
import 'package:get/get.dart';

class AddPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPaymentController>(() => AddPaymentController());
  }
}
