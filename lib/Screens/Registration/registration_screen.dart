import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/Registration/registration_controller.dart';
import 'package:budget_buddie/Utils/Widgets/common_progress_bar.dart';
import 'package:budget_buddie/Utils/Widgets/common_textfield.dart';
import 'package:budget_buddie/Utils/Widgets/common_toast.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationController registrationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: registrationController.signUpFormKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetIcons.appIcon,
                          height: 40,
                          width: 40,
                        ),
                        TextWidget(
                          'BudgetBuddie',
                          color: AppColor.blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    TextWidget(
                      'Welcome to Budget Buddie',
                      color: AppColor.purpleColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextWidget(
                      'Complete the sign up to get started',
                      color: AppColor.blackColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextField(
                      label: 'First Name',
                      validator: (v) {
                        if (v!.isEmpty) {
                          return ErrorMsg.PLEASE_FIRST_NAME_INPUT;
                        }
                        return null;
                      },
                      textInputType: TextInputType.name,
                      controller: registrationController.firstNameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      label: 'Last Name',
                      validator: (v) {
                        if (v!.isEmpty) {
                          return ErrorMsg.PLEASE_LAST_NAME_INPUT;
                        }
                        return null;
                      },
                      textInputType: TextInputType.name,
                      controller: registrationController.lastNameameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      label: 'Email',
                      validator: (v) {
                        if (v!.isEmpty) {
                          return ErrorMsg.PLEASE_EMAIL_INPUT;
                        }
                        return null;
                      },
                      textInputType: TextInputType.emailAddress,
                      controller: registrationController.emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => CustomTextField(
                        label: 'Password',
                        validator: (v) {
                          if (v!.isEmpty) {
                            return ErrorMsg.PLEASE_PASSWORD_INPUT;
                          }
                          return null;
                        },
                        obscureText: registrationController.isObscure.value,
                        controller: registrationController.passwordController,
                        suffixIcon: InkWell(
                          onTap: () {
                            registrationController.isObscure.value =
                                !registrationController.isObscure.value;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 8, bottom: 8, right: 2),
                            child: SvgPicture.asset(
                                registrationController.isObscure.value
                                    ? AssetSvgs.eyesIcon
                                    : AssetSvgs.hideEyesIcon),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: registrationController.isCheckBox.value,
                            onChanged: (val) {
                              registrationController.isCheckBox.value = val!;
                            },
                            side: MaterialStateBorderSide.resolveWith(
                              (Set<MaterialState> states) {
                                return const BorderSide(
                                    color: AppColor.darkBlueColor);
                              },
                            ),
                            checkColor: AppColor.whiteColor,
                            activeColor: AppColor.blackColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By signing up, you agree to the ',
                                  style: TextStyle(
                                    color: const Color(0xFF131313),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed(Routes.inAppWebViewScreen);
                                    },
                                  text: 'Terms of Service and Privacy Policy',
                                  style: TextStyle(
                                    color: const Color(0xFF014479),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ).marginOnly(top: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(
                      () => CustomButton(
                        widget: registrationController.isLoading.value
                            ? const CommonCircularProgressBar()
                            : null,
                        buttonText: "Register",
                        onBtnPress: () {
                          // Get.toNamed(Routes.getStartedScreen);
                          registrationController.isCheckBox.value == false
                              ? Fluttertoast.showToast(
                                  msg: ErrorMsg.PLEASE_CHECK_BOX,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 15.0)
                              // : Get.toNamed(Routes.selectPlanScreen);
                              : registrationController.registration();
                        },
                        width: 16.w,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    InkWell(
                      onTap: () {
                        if (box.read(GetStorageKey.isPinLogin) == true) {
                          Get.toNamed(Routes.pinLoginScreen);
                        } else {
                          Get.toNamed(Routes.passwordLoginScreen);
                        }
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                  color: AppColor.textSecondaryColor
                                      .withOpacity(0.8),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  color: AppColor.darkBlueColor,
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
