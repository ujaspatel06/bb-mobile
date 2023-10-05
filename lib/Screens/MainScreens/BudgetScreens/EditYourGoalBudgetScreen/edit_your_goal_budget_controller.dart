import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/constant.dart';

class EditYourGoalBudgetController extends GetxController {

  final RxMap<Color, String> pickColorItemList = {
    AppColor.pickRedColor: 'Red',
    AppColor.pickLightGreenColor: 'Light green',
    AppColor.pickBlueColor: 'Blue',
    AppColor.pickGreenColor: 'Green',
    AppColor.pickYellowColor: 'Yellow',
    AppColor.pickLightBlueColor: 'Light blue',
    AppColor.pickOrangeColor: 'Orange',
    AppColor.pickPinkColor: 'Pink',
    AppColor.pickPurpleColor: 'Purple',
  }.obs;


  RxString imageName = ''.obs;
  RxString imagePath = ''.obs;
  final GlobalKey<FormState> editGoalBudgetKey = GlobalKey<FormState>();

  TextEditingController goalAmountController  =  TextEditingController();
  TextEditingController startDateController  =  TextEditingController();
  TextEditingController endDateController  =  TextEditingController();
  TextEditingController accountAssController  =  TextEditingController();
  TextEditingController emojiController  =  TextEditingController();


  Rx<Color> pickSelectedColor = AppColor.pickRedColor.obs;
  RxString pickSelectedColorName = 'Red'.obs;
}
