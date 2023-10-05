// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:budget_buddie/Screens/Registration/SelectPlan/selectPlan_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SelectPlanScreen extends StatefulWidget {
  const SelectPlanScreen({super.key});

  @override
  State<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  SelectPlanController selectPlanController = Get.find();

  @override
  void initState() {
    super.initState();
  }

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
                'Start your free trial',
                color: AppColor.purpleColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 8,
              ),
              TextWidget(
                'Select a plan below to start your 30-day free trial.',
                color: AppColor.blackColor,
                textAlign: TextAlign.start,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextWidget(
                    "Monthly plans",
                    fontSize: 16.sp,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  Obx(
                    () => CupertinoSwitch(
                      trackColor: AppColor.blueColor,
                      onChanged: (bool value) {
                        selectPlanController.selectPlanSwitch.value = value;
                        selectPlanController.getOffers();
                      },
                      value: selectPlanController.selectPlanSwitch.value,
                    ),
                  ),
                  TextWidget(
                    "Yearly plans",
                    fontSize: 16.sp,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Obx(() => selectPlanController.availablePackages.isNotEmpty
                  ? Column(
                      children: [
                        InkWell(
                          onTap: () {
                            selectPlanController.planGroupValue.value =
                                "Standard";
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [commonBoxshdow(blurRadius: 10)],
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    AssetPngs.standardContainerItem,
                                    fit: BoxFit.cover,
                                    width: 100.w,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 22, horizontal: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 25,
                                        child: Radio(
                                            activeColor: Colors.white,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => AppColor
                                                        .blueAccentColor),
                                            value: "Standard",
                                            groupValue: selectPlanController
                                                .planGroupValue.value,
                                            onChanged: (value) {
                                              selectPlanController
                                                  .planGroupValue
                                                  .value = value!;
                                            }),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                TextWidget(
                                                  "Standard - ${selectPlanController.availablePackages.first.storeProduct.priceString}",
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                TextWidget(
                                                  "/Month",
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 40),
                                              child: TextWidget(
                                                "Our most popular plan with all you need. Includes access to most features such as dashboard, budget, cashflow, goals, and 5 connections.",
                                                textAlign: TextAlign.left,
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            selectPlanController.planGroupValue.value = "Pro";
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black54,
                                ),
                                color: AppColor.whiteColor,
                                boxShadow: [commonBoxshdow(blurRadius: 10)],
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 25,
                                    child: Radio(
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => AppColor.blueColor),
                                        value: "Pro",
                                        groupValue: selectPlanController
                                            .planGroupValue.value,
                                        onChanged: (value) {
                                          selectPlanController
                                              .planGroupValue.value = value!;
                                        }),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            TextWidget(
                                              "Pro - ${selectPlanController.availablePackages.last.storeProduct.priceString}",
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
                                          height: 3,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 40),
                                          child: TextWidget(
                                            "Ideal for families and finance fanatics, full access to all features including, Dashboard, budget, cashflow, goals, net worth, retirement planner, 10 connections.",
                                            color: AppColor.blackColor,
                                            textAlign: TextAlign.left,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox()),
              SizedBox(
                height: 7.h,
              ),
              CustomButton(
                buttonText: 'Confirm Plan',
                onBtnPress: () async {
                  // Offerings offerings = await Purchases.getOfferings();
                  //
                  // print("HELOO" + offerings.all.toString());
                  // if (offerings.current != null) {
                  //   // Display current offering with offerings.current
                  //   print(offerings.current);
                  // }

                  // final storeProduct = StoreProduct("annual.P", "description",
                  //     "title", 9.9, "priceString", "+1");
                  // // if(selectPlanController.selectPlanSwitch.)
                  // await Purchases.purchaseStoreProduct(storeProduct);
                  // Get.toNamed(Routes.addPaymentScreen);
                  // Get.toNamed(Routes.mainScreen);
                  // Get.to(() => WeatherScreen());
                  selectPlanController.purchasePlan();
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
