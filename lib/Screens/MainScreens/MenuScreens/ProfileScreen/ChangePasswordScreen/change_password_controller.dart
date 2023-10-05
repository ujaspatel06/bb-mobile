// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks

import 'package:budget_buddie/Screens/MainScreens/MenuScreens/ProfileScreen/ChangePasswordScreen/change_password_repository.dart';
import 'package:budget_buddie/Utils/Widgets/custom_snackbar.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;
  final GlobalKey<FormState> changePassFormKey = GlobalKey<FormState>();
  ChangePassRepository changePassRepository = ChangePassRepository();

  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confPassController = TextEditingController();

  changePassword(BuildContext context) async {
    if (changePassFormKey.currentState!.validate() && !isLoading.value) {
      // TODO: REGISTER HERE
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await changePassRepository.changePassword({
          "userUuid": userInfo["userUuid"].toString(),
          "oldPassword": oldPassController.text,
          "newPassword": newPassController.text,
        });
        if (response.code == '1') {
          debugPrint("${response.message}");
          debugPrint("${response.code}");
          Navigator.pop(context);
          oldPassController.clear();
          newPassController.clear();
          confPassController.clear();
          SnackBars.successSnackBar(content: response.message!);
        }
      } catch (e) {
        // rethrow;
        debugPrint("::::::::::$e::::::::::");
      } finally {
        isLoading.value = false;
      }
    }
  }
}
