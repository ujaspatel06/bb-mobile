import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/LoginScreens/PasswordLoginScreen/password_login_repository.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PasswordLoginController extends GetxController {
  RxBool isObscure = true.obs;
  var isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GoogleSignIn googleSignIn = GoogleSignIn();
  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();
  LoginRepository loginRepository = LoginRepository();

  Future<void> getGoogleSignIn() async {
    try {
      var result = await googleSignIn.signIn();
      debugPrint("$result");
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    }
  }

  login() async {
    if (logInFormKey.currentState!.validate() && !isLoading.value) {
      // TODO: REGISTER HERE
      try {
        isLoading.value = true;
        var response = await loginRepository.login({
          "email": emailController.text,
          "password": passwordController.text,
        });
        if (response.userId != null) {
          GetStorage().write(GetStorageKey.USER_INFO, response.toJson());
          // SnackBars.successSnackBar(content: "Login SuccessFully");
          Get.offAllNamed(Routes.mainScreen);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }
}
