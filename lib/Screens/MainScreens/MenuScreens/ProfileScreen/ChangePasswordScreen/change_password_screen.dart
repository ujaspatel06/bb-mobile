import 'package:budget_buddie/Screens/MainScreens/MenuScreens/ProfileScreen/ChangePasswordScreen/change_password_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/custom_textfield.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: context.theme.textTheme.titleMedium!.color,
              )),
        ],
        titleWidget: TextWidget(
          "Change password",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: changePasswordController.changePassFormKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TextWidget(
                      "Password",
                      fontSize: 13.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    customCardTextField(
                        validator: (v) {
                          if (v!.isEmpty) {
                            return ErrorMsg.PLEASE_PASSWORD_INPUT;
                          }
                          return null;
                        },
                        controller: changePasswordController.oldPassController,
                        boxShadow: [commonBoxshdow(blurRadius: 30)],
                        decorationColor: context.theme.primaryColor,
                        cursorColor:
                            context.theme.textTheme.titleMedium!.color!,
                        hintColor: context.theme.textTheme.titleMedium!.color!,
                        textColor: context.theme.textTheme.titleMedium!.color!),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        TextWidget(
                          "New password",
                          fontSize: 13.sp,
                          color: context.theme.textTheme.titleMedium!.color,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        customCardTextField(
                            validator: (v) {
                              if (v!.isEmpty) {
                                return ErrorMsg.PLEASE_PASSWORD_INPUT;
                              }
                              return null;
                            },
                            controller:
                                changePasswordController.newPassController,
                            boxShadow: [commonBoxshdow(blurRadius: 30)],
                            decorationColor: context.theme.primaryColor,
                            cursorColor:
                                context.theme.textTheme.titleMedium!.color!,
                            hintColor:
                                context.theme.textTheme.titleMedium!.color!,
                            textColor:
                                context.theme.textTheme.titleMedium!.color!),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        TextWidget(
                          "Confirm new password",
                          fontSize: 13.sp,
                          color: context.theme.textTheme.titleMedium!.color,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        customCardTextField(
                            validator: (v) {
                              if (v!.isEmpty) {
                                return ErrorMsg.PLEASE_PASSWORD_INPUT;
                              } else if (changePasswordController
                                      .newPassController.text !=
                                  changePasswordController
                                      .confPassController.text) {
                                return ErrorMsg.CONFIRM_PASS_NOT_MATCH;
                              }
                              return null;
                            },
                            controller:
                                changePasswordController.confPassController,
                            boxShadow: [commonBoxshdow(blurRadius: 30)],
                            decorationColor: context.theme.primaryColor,
                            cursorColor:
                                context.theme.textTheme.titleMedium!.color!,
                            hintColor:
                                context.theme.textTheme.titleMedium!.color!,
                            textColor:
                                context.theme.textTheme.titleMedium!.color!),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                      buttonText: 'Change password',
                      backgroundColor: AppColor.darkBlueColor,
                      onBtnPress: () {
                        changePasswordController.changePassword(context);
                      },
                      width: 16.w,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
