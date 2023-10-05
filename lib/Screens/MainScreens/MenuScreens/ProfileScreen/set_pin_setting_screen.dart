import 'package:budget_buddie/Screens/LoginScreens/PinLoginScreen/components/pin_code_widget.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/ProfileScreen/profile_controller.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SetPinSettingScreen extends StatefulWidget {
  const SetPinSettingScreen({super.key});

  @override
  State<SetPinSettingScreen> createState() => _SetPinSettingScreenState();
}

class _SetPinSettingScreenState extends State<SetPinSettingScreen> {
  ProfileController profileController = Get.find();
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
                            profileController.loginPin.value = pin;
                            // Get.offNamed(Routes.mainScreen);
                          } else {
                            profileController.loginPin.value = '';
                          }
                        },
                        onEnter: (pin, _) {
                          // callback user pressed enter
                        },
                      ),
                    ),
                    CustomButton(
                      buttonText: "Set up login pin",
                      onBtnPress: () {
                        if (profileController.loginPin.value.length == 4) {
                          print("pin set");
                          box.write(GetStorageKey.loginPin,
                              profileController.loginPin.value);
                          box.write(GetStorageKey.isPinLogin, true);
                          profileController.isPinLogin.value = true;
                        } else {
                          print("pin not set");
                          box.remove(GetStorageKey.loginPin);
                          box.write(GetStorageKey.isPinLogin, false);
                          profileController.isPinLogin.value = false;
                        }
                        Navigator.pop(context);
                      },
                      height: 60,
                      textColor: context.theme.primaryColor,
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
