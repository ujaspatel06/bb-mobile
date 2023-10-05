import 'package:budget_buddie/Screens/LoginScreens/ForgotPasswordScreen/forgot_password_controller.dart';
import 'package:budget_buddie/Utils/Widgets/common_progress_bar.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/custom_textfield.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                height: 7.h,
              ),
              TextWidget(
                'Forgot Your Password',
                color: context.theme.hintColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                'Enter email to forgot your password',
                color: AppColor.greyColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextWidget(
                    "Email",
                    fontSize: 13.sp,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Form(
                    key: forgotPasswordController.forgotFormKey,
                    child: customCardTextField(
                        validator: (v) {
                          if (v!.isEmpty) {
                            return ErrorMsg.PLEASE_EMAIL_INPUT;
                          }
                          return null;
                        },
                        decorationColor:
                            context.theme.textTheme.labelLarge!.color!,
                        cursorColor:
                            context.theme.textTheme.titleMedium!.color!,
                        hintColor: context.theme.textTheme.titleMedium!.color!,
                        textColor: context.theme.textTheme.titleMedium!.color!),
                  ),
                  const SizedBox(
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(
                ()=> CustomButton(
                  widget: forgotPasswordController.isLoading.value?const CommonCircularProgressBar():null,

                  buttonText: 'Continue',
                  onBtnPress: () {
                    forgotPasswordController.forgotPass();
                    // Get.toNamed(Routes.selectPlanScreen);
                  },
                  width: 16.w,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
