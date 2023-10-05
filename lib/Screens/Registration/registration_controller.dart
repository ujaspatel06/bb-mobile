import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Utils/Widgets/custom_snackbar.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'registration_repository.dart';

class RegistrationController extends GetxController {
  RxBool isObscure = true.obs;
  RxBool isCheckBox = false.obs;
  var isLoading = false.obs;
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  RegisterRepository registerRepository = RegisterRepository();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  registration() async {
    if (signUpFormKey.currentState!.validate() && !isLoading.value) {
      // TODO: REGISTER HERE
      try {
        isLoading.value = true;
        var response = await registerRepository.register({
          "firstName": firstNameController.text,
          "lastName": lastNameameController.text,
          "email": emailController.text,
          "password": passwordController.text,
        });
        if (response.userId != null) {
          GetStorage().write(GetStorageKey.USER_INFO, response.toJson());
          SnackBars.successSnackBar(content: "Registered SuccessFully");
          Get.offAllNamed(Routes.addPaymentScreen);
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
