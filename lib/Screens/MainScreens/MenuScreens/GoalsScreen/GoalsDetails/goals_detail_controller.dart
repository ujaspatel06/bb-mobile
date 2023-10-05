// import 'package:budget_buddie/Data/Models/goals_model.dart';
// import 'package:budget_buddie/Screens/MainScreens/MenuScreens/GoalsScreen/GoalsDetails/goals_details_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../../../../../Utils/constant.dart';
//
// class GoalsDetailController extends GetxController {
//   final RxMap<Color, String> pickColorItemList = {
//     AppColor.pickRedColor: 'Red',
//     AppColor.pickLightGreenColor: 'Light green',
//     AppColor.pickBlueColor: 'Blue',
//     AppColor.pickGreenColor: 'Green',
//     AppColor.pickYellowColor: 'Yellow',
//     AppColor.pickLightBlueColor: 'Light blue',
//     AppColor.pickOrangeColor: 'Orange',
//     AppColor.pickPinkColor: 'Pink',
//     AppColor.pickPurpleColor: 'Purple',
//   }.obs;
//
//   final RxMap<String, String> howOftenItems = {
//     'A': 'Weekly',
//     'B': 'Fortnightly',
//     'C': 'Monthly',
//   }.obs;
//
//   Rx<Color> pickSelectedColor = AppColor.pickRedColor.obs;
//   RxString pickSelectedColorName = 'Red'.obs;
//   RxString howOftenSelectedVal = 'A'.obs;
//
//   Color darken(Color color, [double amount = .1]) {
//     final hsl = HSLColor.fromColor(color);
//     final darkness = (1.0 - amount).clamp(0.0, 1.0);
//     return hsl
//         .withLightness((hsl.lightness * darkness).clamp(0.0, 1.0))
//         .toColor();
//   }
//
//   RxList<Goals> goalsList = <Goals>[].obs;
//   var isLoading = true.obs;
//
//   GoalsRepository goalsRepository = GoalsRepository();
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   Future getGoalsList({bool isLoaderShow = false}) async {
//     try {
//       isLoading.value = true;
//       var token =
//           GetStorage().read(AppPreferencesHelper.USER_INFO) ?? '{}' as Map;
//       goalsList.clear();
//       var response = await goalsRepository.getGoalsList(
//           token["userUuid"].toString(),
//           isLoaderShow: isLoaderShow);
//
//       if (response.goals != null) {
//         List<Goals> _goals = <Goals>[];
//         _goals.addAll(response.goals!);
//         goalsList.addAll(_goals.reversed);
//       }
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
