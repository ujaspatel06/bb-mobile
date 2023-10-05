import 'package:budget_buddie/Screens/LoginScreens/ForgotPasswordScreen/forgot_password_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();
  ForgotPassRepository forgotPassRepository = ForgotPassRepository();

  forgotPass() async {
    if (forgotFormKey.currentState!.validate() && !isLoading.value) {
      // TODO: REGISTER HERE
      try {
        isLoading.value = true;
        // var response = await forgotPassRepository.forgotPass({
        //   "email": emailController.text,
        // });
        // if (response.code != 0) {
        //   SnackBars.successSnackBar(content: "Check email for reset password");
        //   Get.back();
        // }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }
}
