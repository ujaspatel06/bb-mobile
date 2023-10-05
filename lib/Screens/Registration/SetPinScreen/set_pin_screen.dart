import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/LoginScreens/PinLoginScreen/components/pin_code_widget.dart';
import 'package:budget_buddie/Screens/LoginScreens/local_auth_service.dart';
import 'package:budget_buddie/Screens/Registration/SetPinScreen/set_pin_controller.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key});

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  SetPinController setPinController = Get.find();
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
                const SizedBox(
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
                    const SizedBox(
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
                        borderSide: const BorderSide(
                            color: AppColor.textSecondaryColor),
                        onChangedPin: (pin) {
                          if (pin.length == 4) {
                            box.write(GetStorageKey.loginPin, pin);
                            box.write(GetStorageKey.isFaceId, true);
                            // Get.offNamed(Routes.mainScreen);
                          }
                        },
                        onEnter: (pin, _) {
                          // callback user pressed enter
                        },
                      ),
                    ),
                    Row(children: [
                      Expanded(
                        child: CustomButton(
                          buttonText: "Set up face identification",
                          onBtnPress: () {
                            Get.back();
                          },
                          height: 60,
                          textColor: context.theme.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      GestureDetector(
                        onTap: () async {
                          bool isAuth = await LocalAuth.authenticate();
                          // Get.offNamed(Routes.mainScreen);
                          box.write(GetStorageKey.isBiometricValid, isAuth);
                          box.write(GetStorageKey.isFaceId, isAuth);
                          debugPrint('---------$isAuth');
                        },
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.all(9),
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
                    ]),
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
                          const SizedBox(
                            width: 10,
                          ),
                          TextWidget(
                            "OR",
                            fontSize: 10.sp,
                            color: context.theme.cardColor,
                          ),
                          const SizedBox(
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
                          const Center(
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
                    const SizedBox(
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
                          const Center(
                              child: TextWidget(
                            "Sign in with Google",
                            color: Colors.grey,
                          ))
                        ]),
                        buttonText: "",
                        onBtnPress: () {
                          setPinController.getGoogleSignIn();
                        },
                        backgroundColor:
                            context.theme.textTheme.labelLarge!.color!),
                    const SizedBox(
                      height: 50,
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
                    ),
                    const SizedBox(
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
