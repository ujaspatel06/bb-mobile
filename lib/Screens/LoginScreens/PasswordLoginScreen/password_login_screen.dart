// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/LoginScreens/PasswordLoginScreen/password_login_controller.dart';
import 'package:budget_buddie/Screens/LoginScreens/local_auth_service.dart';
import 'package:budget_buddie/Utils/Widgets/common_progress_bar.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/custom_textfield.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PasswordLoginScreen extends StatefulWidget {
  const PasswordLoginScreen({super.key});

  @override
  State<PasswordLoginScreen> createState() => _PasswordLoginScreenState();
}

class _PasswordLoginScreenState extends State<PasswordLoginScreen> {
  PasswordLoginController passwordLoginController =
      Get.put(PasswordLoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: passwordLoginController.logInFormKey,
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
                        color: context.theme.textTheme.titleMedium!.color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextWidget(
                    "Login",
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      TextWidget(
                        "Email",
                        fontSize: 13.sp,
                        color: context.theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      customCardTextField(
                          validator: (v) {
                            if (v!.isEmpty) {
                              return ErrorMsg.PLEASE_EMAIL_INPUT;
                            }
                            return null;
                          },
                          textInputType: TextInputType.emailAddress,
                          controller: passwordLoginController.emailController,
                          decorationColor:
                              context.theme.textTheme.labelLarge!.color!,
                          cursorColor:
                              context.theme.textTheme.titleMedium!.color!,
                          hintColor:
                              context.theme.textTheme.titleMedium!.color!,
                          textColor:
                              context.theme.textTheme.titleMedium!.color!),
                      SizedBox(
                        height: 4,
                      ),
                      TextWidget(
                        "Example: cameronsouth@gmail.com",
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      TextWidget(
                        "Password",
                        fontSize: 13.sp,
                        color: context.theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => customCardTextField(
                            textInputType: TextInputType.visiblePassword,
                            controller:
                                passwordLoginController.passwordController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return ErrorMsg.PLEASE_PASSWORD_INPUT;
                              }
                              return null;
                            },
                            isObsecure: passwordLoginController.isObscure.value,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                passwordLoginController.isObscure.value =
                                    !passwordLoginController.isObscure.value;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  passwordLoginController.isObscure.value
                                      ? AssetSvgs.eyesIcon
                                      : AssetSvgs.hideEyesIcon,
                                  color: context.theme.hintColor,
                                ),
                              ),
                            ),
                            decorationColor:
                                context.theme.textTheme.labelLarge!.color!,
                            cursorColor:
                                context.theme.textTheme.titleMedium!.color!,
                            hintColor:
                                context.theme.textTheme.titleMedium!.color!,
                            textColor:
                                context.theme.textTheme.titleMedium!.color!),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.forgotPasswordScreen);
                        },
                        child: TextWidget(
                          "Forgot Password?",
                          fontWeight: FontWeight.w500,
                          color: AppColor.buttonGreenColor,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => CustomButton(
                            widget: passwordLoginController.isLoading.value
                                ? CommonCircularProgressBar()
                                : null,
                            buttonText: "Log in",
                            onBtnPress: () {
                              passwordLoginController.login();
                            },
                            height: 60,
                            textColor: context.theme.primaryColor,
                          ),
                        ),
                      ),
                      if (box.read(GetStorageKey.isFaceId) == true) ...[
                        SizedBox(
                          width: 14,
                        ),
                        GestureDetector(
                          onTap: () async {
                            bool _isBioMetric =
                                box.read(GetStorageKey.isBiometricValid) ??
                                    false;
                            if (_isBioMetric) {
                              bool isAuth = await LocalAuth.authenticate();
                              if (isAuth) {
                                Get.offNamed(Routes.mainScreen);
                              }
                            }
                          },
                          child: Container(
                            height: 60,
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColor.buttonGreenColor, width: 3),
                            ),
                            child: Image.asset(
                              AssetIcons.faceLock,
                              color: AppColor.buttonGreenColor,
                            ),
                          ),
                        )
                      ]
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: context.theme.cardColor,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                          "OR",
                          fontSize: 10.sp,
                          color: context.theme.cardColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Divider(
                            color: context.theme.cardColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                      height: 55,
                      isShadow: false,
                      widget: Stack(children: [
                        Image.asset(
                          AssetIcons.apple,
                          color: context.theme.textTheme.titleLarge!.color,
                          alignment: Alignment.centerLeft,
                        ),
                        Center(
                            child: TextWidget(
                          "Sign in with Apple",
                          color: Colors.grey,
                        ))
                      ]),
                      buttonText: "",
                      onBtnPress: () {},
                      textColor: AppColor.textSecondaryColor,
                      backgroundColor:
                          context.theme.textTheme.labelLarge!.color!),
                  SizedBox(
                    height: 18,
                  ),
                  CustomButton(
                      isShadow: false,
                      height: 55,
                      widget: Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            top: 8,
                          ),
                          child: Image.asset(
                            AssetIcons.google,
                            alignment: Alignment.centerLeft,
                            height: 35,
                          ),
                        ),
                        Center(
                            child: TextWidget(
                          "Sign in with Google",
                          color: Colors.grey,
                        ))
                      ]),
                      buttonText: "",
                      onBtnPress: () {
                        passwordLoginController.getGoogleSignIn();
                      },
                      backgroundColor:
                          context.theme.textTheme.labelLarge!.color!),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(Routes.registrationScreen);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          "New To BudgetBuddie?",
                          color: Colors.grey,
                          fontSize: 10.sp,
                        ),
                        TextWidget(
                          " Register",
                          color: context.theme.hintColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
