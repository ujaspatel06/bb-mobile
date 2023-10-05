// ignore_for_file: use_build_context_synchronously

import 'package:budget_buddie/Screens/MainScreens/MenuScreens/GoalsScreen/goals_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/GoalsScreen/goals_repository.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddGoalController extends GetxController {
  final RxMap<String, String> howOftenItems = {
    'Weekly': 'Weekly',
    'Fortnightly': 'Fortnightly',
    'Monthly': 'Monthly',
  }.obs;

  RxString accountsSelectedItems = ''.obs;

  // Rx<Color> pickSelectedColor = AppColor.pickRedColor.obs;
  RxString pickSelectedColorName = 'Red'.obs;
  RxString howOftenSelectedVal = 'Weekly'.obs;

  RxString imagePath = ''.obs;
  RxString imageName = ''.obs;

  TextEditingController nameGoalController = TextEditingController();
  TextEditingController goalDollarValueController = TextEditingController();
  TextEditingController contributionController = TextEditingController();
  TextEditingController referenceController = TextEditingController();
  TextEditingController personalisedEmojiController = TextEditingController();

  final GlobalKey<FormState> addGoalFormKey = GlobalKey<FormState>();
  GoalsRepository goalsRepository = GoalsRepository();
  GoalsController goalsController = Get.put(GoalsController());

  var isLoading = false.obs;

// Goals
  addGoal(BuildContext context) async {
    if (addGoalFormKey.currentState!.validate() && !isLoading.value) {
      try {
        isLoading.value = true;

        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await goalsRepository.addGoals({
          "userUuid": userInfo["userUuid"].toString(),
          "goalName": nameGoalController.text,
          "value": goalDollarValueController.text,
          "howOften": howOftenSelectedVal.value,
          "contribution": contributionController.text,
          "accountUuid": accountsSelectedItems.value,
          "icon": imageName.value,
          "colour": pickSelectedColorName.value,
        });

        if (response.code == 1) {
          await goalsController.getGoalsList(isLoaderShow: false);
          Navigator.pop(context);
          // SnackBars.successSnackBar(content: response.message!);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
      } finally {
        isLoading.value = false;
      }
    }
  }

  updateGoal(BuildContext context, String id) async {
    if (addGoalFormKey.currentState!.validate() && !isLoading.value) {
      // TODO: INCOME ADD
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await goalsRepository.updateGoals({
          "goalUuid": id,
          "userUuid": userInfo["userUuid"].toString(),
          "goalName": nameGoalController.text,
          "value": goalDollarValueController.text,
          "howOften": howOftenSelectedVal.value,
          "contribution": contributionController.text,
          "accountUuid": howOftenSelectedVal.value,
          "icon": imageName.value,
          "colour": pickSelectedColorName.value,
        });
        if (response.code == 1) {
          await goalsController.getGoalsList(isLoaderShow: false);
          Navigator.pop(context);
          // SnackBars.successSnackBar(content: response.message!);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> deleteGoal(BuildContext context, String id) async {
    if (!isLoading.value) {
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await goalsRepository
            .deleteGoals('${userInfo["userUuid"].toString()}/$id');
        if (response.code == 1) {
          await goalsController.getGoalsList(isLoaderShow: false);
          Navigator.pop(context);
          // SnackBars.successSnackBar(content: response.message!);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
      } finally {
        isLoading.value = false;
      }
    }
  }

  clearGoalFields() {
    nameGoalController.clear();
    goalDollarValueController.clear();
    contributionController.clear();
    referenceController.clear();
    personalisedEmojiController.clear();
    imageName.value = '';
    imagePath.value = '';
  }
}
