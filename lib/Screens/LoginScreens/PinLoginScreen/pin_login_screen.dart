// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/LoginScreens/PinLoginScreen/components/pin_code_widget.dart';
import 'package:budget_buddie/Screens/LoginScreens/PinLoginScreen/pin_login_controller.dart';
import 'package:budget_buddie/Screens/LoginScreens/local_auth_service.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/custom_snackbar.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PinLoginScreen extends StatefulWidget {
  const PinLoginScreen({super.key});

  @override
  State<PinLoginScreen> createState() => _PinLoginScreenState();
}

class _PinLoginScreenState extends State<PinLoginScreen> {
  PinLoginController pinLoginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
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
                  height: 30,
                ),
                Column(
                  children: [
                    TextWidget(
                      "Enter your 4-digit PIN",
                      fontSize: 10.sp,
                      color: context.theme.hintColor,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      // height: 400,
                      color: Colors.transparent,
                      child: CustomPinCodeWidget(
                        minPinLength: 4,
                        maxPinLength: 4,
                        buttonColor: context.theme.primaryColor,
                        enterButtonLabel: AssetIcons.appIcon,
                        filledIndicatorColor: AppColor.textSecondaryColor,
                        numbersStyle: TextStyle(
                          color: AppColor.textSecondaryColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        borderSide:
                            BorderSide(color: AppColor.textSecondaryColor),
                        onChangedPin: (pin) {
                          if (pin.length == 4) {
                            String _loginPin =
                                box.read(GetStorageKey.loginPin) ?? '';
                            if (_loginPin == pin) {
                              Get.offNamed(Routes.mainScreen);
                            } else {
                              SnackBars.errorSnackBar(content: "Pin is Wrong");
                            }
                          }
                        },
                        onEnter: (pin, _) {
                          // callback user pressed enter
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            buttonText: "Log in with password",
                            onBtnPress: () {
                              Get.toNamed(Routes.passwordLoginScreen);
                            },
                            height: 60,
                            textColor: context.theme.primaryColor,
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

                              // print('---------$isAuth');
                            },
                            child: Container(
                              height: 60,
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                          pinLoginController.getGoogleSignIn();
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
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
