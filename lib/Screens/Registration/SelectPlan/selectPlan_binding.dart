// ignore_for_file: file_names

import 'package:budget_buddie/Screens/Registration/SelectPlan/selectPlan_controller.dart';
import 'package:get/get.dart';

class SelectPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectPlanController>(() => SelectPlanController());
  }
}
