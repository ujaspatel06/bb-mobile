// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:budget_buddie/Data/Models/goals_model.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'goals_repository.dart';

class GoalsController extends GetxController {
  RxList<Goals> goalsList = <Goals>[].obs;
  var isLoading = true.obs;

  GoalsRepository goalsRepository = GoalsRepository();

  @override
  void onInit() {
    getGoalsList();
    super.onInit();
  }

  Future getGoalsList({bool isLoaderShow = false}) async {
    try {
      isLoading.value = true;
      var token = GetStorage().read(GetStorageKey.USER_INFO) ?? '{}' as Map;
      goalsList.clear();
      var response = await goalsRepository.getGoalsList(
          token["userUuid"].toString(),
          isLoaderShow: isLoaderShow);

      if (response.goals != null) {
        List<Goals> _goals = <Goals>[];
        _goals.addAll(response.goals!);
        goalsList.addAll(_goals.reversed);
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    } finally {
      isLoading.value = false;
    }
  }

  // Color darken(Color color, [double amount = .1]) {
  //   final hsl = HSLColor.fromColor(color);
  //   final darkness = (1.0 - amount).clamp(0.0, 1.0);
  //   return hsl
  //       .withLightness((hsl.lightness * darkness).clamp(0.0, 1.0))
  //       .toColor();
  // }
}
