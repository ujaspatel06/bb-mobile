import 'dart:math';

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/common_chip.dart';
import 'package:budget_buddie/Utils/Widgets/common_progreebar.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../BudgetScreens/BudgetDetailScreen/budget_detail_screen.dart';

class SpendvsBudget extends StatefulWidget {
  const SpendvsBudget({super.key});

  @override
  State<SpendvsBudget> createState() => _SpendvsBudgetState();
}

class _SpendvsBudgetState extends State<SpendvsBudget> {
  DashBoardController dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return isLoading?_shimmerSpendBudget():
    Obx(
      () => Column(
        children: [
          Row(
            children: [
              TextWidget(
                "Spend vs budget",
                fontSize: 16.sp,
                color: context.theme.textTheme.titleMedium!.color,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              if (!dashBoardController.isWidegetHide("Spend vs budget"))
                InkWell(
                  onTap: () {
                    commonModalSheet(
                      context,
                      title: "Date range",
                      heigth: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            "Periods",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: context.theme.textTheme.titleMedium!.color,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => Wrap(
                              children: [
                                for (var i = 0;
                                    i <
                                        dashBoardController
                                            .dateRangeItem.length;
                                    i++)
                                  GestureDetector(
                                    onTap: () {
                                      dashBoardController
                                              .spendBudgetSelectedItem.value =
                                          dashBoardController.dateRangeItem[i];
                                      Get.back();
                                    },
                                    child: Chip(
                                      visualDensity: const VisualDensity(
                                          vertical: -3, horizontal: 0),
                                      label: TextWidget(
                                          dashBoardController.dateRangeItem[i],
                                          fontSize: 10.sp,
                                          color: dashBoardController
                                                      .spendBudgetSelectedItem
                                                      .value ==
                                                  dashBoardController
                                                      .dateRangeItem[i]
                                              ? AppColor.whiteColor
                                              : context.theme.textTheme
                                                  .titleMedium!.color),
                                      backgroundColor: dashBoardController
                                                  .spendBudgetSelectedItem
                                                  .value ==
                                              dashBoardController
                                                  .dateRangeItem[i]
                                          ? SaprateLightDarkColor
                                              .greenLightColor
                                          : context.theme.primaryColor,
                                      side: BorderSide(
                                          color: dashBoardController
                                                      .spendBudgetSelectedItem
                                                      .value ==
                                                  dashBoardController
                                                      .dateRangeItem[i]
                                              ? context.theme.primaryColor
                                              : AppColor.greyColor),
                                    ).marginOnly(right: 10, bottom: 5),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Obx(
                    () => CommonChip(
                        title:
                            dashBoardController.spendBudgetSelectedItem.value),
                  ),
                ),

              // Obx(
              //   () => CustomDropdownButtonWithList(
              //     dropDownList: dashBoardController.tempItemsList,
              //     onChanged: (String? value) {
              //       dashBoardController.tempSelectedValue2.value = value!;
              //     },
              //     value: dashBoardController.tempSelectedValue2.value,
              //   ),
              // ),
            ],
          ).marginOnly(
              bottom: !dashBoardController.isWidegetHide("Spend vs budget")
                  ? 12
                  : 0),
          if (dashBoardController.isWidegetHide("Spend vs budget"))
            const SizedBox(
              height: 10,
            ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: 110),
            itemCount:
                dashBoardController.isShowSpendBudget.value == true ? 6 : 4,
            itemBuilder: (BuildContext ctx, index) {
              int randNo = Random().nextInt(6);
              return InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings:
                        const RouteSettings(name: Routes.budgetDetailScreen),
                    screen: BudgetDetailScreen(
                        budgetDetailName:
                            dashBoardController.spendBudgetList[index]),
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      boxShadow: [commonBoxshdow()],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  dashBoardController.spendBudgetList[index],
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextWidget("\$699",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: context
                                        .theme.textTheme.titleMedium!.color),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            )
                          ],
                        ),

                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextWidget("\$263 left",
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color:
                                    context.theme.textTheme.titleMedium!.color),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        // LinearProgressIndicator()

                        CommonLinerProgressBar(
                          maxValue: 100,
                          size: 8,
                          borderRadius: BorderRadius.circular(50),
                          progressColor:
                              dashBoardController.dashboardGridColor[randNo],
                          backgroundColor: dashBoardController
                              .dashboardGridColor[randNo]
                              .withOpacity(0.2),
                          currentValue: 45,
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  dashBoardController.isShowSpendBudget.value =
                      !dashBoardController.isShowSpendBudget.value;
                },
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextWidget(
                    dashBoardController.isShowSpendBudget.value == true
                        ? "See less"
                        : "See All",
                    color: AppColor.blueaccentLightColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _shimmerSpendBudget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 24,
                width: 120,
                decoration: ShapeDecoration(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const Spacer(),
              CommonChip(
                  title: dashBoardController.spendBudgetSelectedItem.value),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: 110),
            itemCount:
                dashBoardController.isShowSpendBudget.value == true ? 6 : 4,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: context.theme.primaryColor,

                    borderRadius: BorderRadius.circular(15)),
              );
            },
          ),
        ],
      ),
    );
  }
}
