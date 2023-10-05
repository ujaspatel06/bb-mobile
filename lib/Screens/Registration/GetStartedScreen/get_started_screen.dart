// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         Get.toNamed(Routes.mainScreen);
              //       },
              //       child: Container(
              //         width: 60,
              //         height: 35,
              //         padding: const EdgeInsets.symmetric(vertical: 8),
              //         decoration: ShapeDecoration(
              //           color: Colors.white.withOpacity(0.15),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(25),
              //           ),
              //         ),
              //         child: Center(
              //           child: Text(
              //             'Skip',
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 11.sp,
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              TextWidget(
                'Get started',
                color: AppColor.blackColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                'Get most out of your budget buddie account',
                color: AppColor.blackColor,
                textAlign: TextAlign.left,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 6.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.verifyEmailScreen);
                    },
                    child: customContainer(
                        backgroundColor: Color(0xFF8F6BF5),
                        assetColor: Color(0xFF4D27BA),
                        text: "Verify your email address",
                        info:
                            "This is the bank account we would track and manage your spendings",
                        assetString: AssetPngs.atEmail),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.connectAccountScreen);
                    },
                    child: customContainer(
                        backgroundColor: Color(0xFF72CBF8),
                        text: "Connect your accounts",
                        info:
                            "This is the bank account we would track and manage your spendings",
                        assetString: AssetPngs.bankGroup),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.setPinScreen);
                    },
                    child: customContainer(
                        backgroundColor: Color(0xFFFB9FA1),
                        assetColor: Color(0xFFAE3C3C),
                        text: "Setup a security pin",
                        info:
                            "This is the bank account we would track and manage your spendings",
                        assetString: AssetPngs.lock),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonText: 'Set up complete 🎉',
                onBtnPress: () {
                  Get.toNamed(Routes.mainScreen);
                },
                height: 70,
                backgroundColor: AppColor.greenAssentColor,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget customContainer(
      {String text = "",
      String info = "",
      String assetString = "",
      Color backgroundColor = AppColor.blackColor,
      Color? assetColor}) {
    return Column(
      children: [
        Container(
          decoration: ShapeDecoration(
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      info,
                      fontSize: 9.5.sp,
                      maxLine: 2,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(16)),
                child: Image.asset(
                  assetString,
                  color: assetColor,
                  height: 120,
                ),
              ),
            )
          ]),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
