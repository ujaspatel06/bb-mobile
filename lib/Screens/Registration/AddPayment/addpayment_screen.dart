// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/Registration/AddPayment/Components/custom_card_textfield.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({super.key});
  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
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
                    color: AppColor.blackColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              TextWidget(
                'Add a payment method',
                color: AppColor.purpleColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                'You won’t be charged until after your 30-day free trial.',
                color: AppColor.blackColor,
                textAlign: TextAlign.left,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.whiteColor,
                    boxShadow: [commonBoxshdow()]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 33, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        "Plan selected:",
                        color: AppColor.blueColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Row(
                        children: [
                          TextWidget(
                            "Standard - \$9",
                            fontSize: 16.sp,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            "/Month",
                            fontSize: 12.sp,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      customCardTextField(title: "Name"),
                      customCardTextField(
                        maxLength: 19,
                        isInputFormater: true,
                        title: "Card number",
                        suffixIcon: Image.asset(
                          AssetIcons.visaIcon,
                          height: 22,
                        ),
                      ),
                      customCardTextField(
                        title: "Expire date",
                        maxLength: 5,
                        isExpiredate: true,
                        isInputFormater: true,
                        suffixIcon: Positioned(
                          bottom: 0,
                          child: Tooltip(
                            message: 'Lorem ipsum dolor sit amet, consectetur '
                                'adipiscing elit, sed do eiusmod tempor incididunt... ',
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.all(20),
                            triggerMode: TooltipTriggerMode.tap,
                            showDuration: Duration(seconds: 10),
                            decoration: BoxDecoration(
                              color: AppColor.darkBlueColor.withOpacity(0.8),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            textStyle: TextStyle(color: Colors.white),
                            preferBelow: true,
                            verticalOffset: 10,
                            child: Image.asset(
                              AssetIcons.helpCircle,
                              height: 18,
                            ),
                          ),
                        ),
                      ),
                      customCardTextField(
                          title: "CVV", maxLength: 3, isInputFormater: true),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              CustomButton(
                buttonText: 'Add payment method',
                onBtnPress: () {
                  Get.toNamed(Routes.getStartedScreen);
                },
                width: 16.w,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
