import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/BudgetDetailScreen/budget_detail_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/EditYourGoalBudgetScreen/edit_your_goal_budget_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/budget_summary_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/common_chip.dart';
import 'package:budget_buddie/Utils/Widgets/common_progreebar.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class BudgetSummaryScreen extends StatefulWidget {
  const BudgetSummaryScreen({super.key});

  @override
  State<BudgetSummaryScreen> createState() => _BudgetSummaryScreenState();
}

class _BudgetSummaryScreenState extends State<BudgetSummaryScreen> {
  BudgetSummaryController budgetSummaryController =
      Get.put(BudgetSummaryController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextWidget(
                "Income vs Budget",
                fontSize: 16.sp,
                color: context.theme.textTheme.titleMedium!.color,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
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
                                      budgetSummaryController
                                          .dateRangeItem.length;
                                  i++)
                                GestureDetector(
                                  onTap: () {
                                    budgetSummaryController
                                            .incomeBudgetSelectedItem.value =
                                        budgetSummaryController
                                            .dateRangeItem[i];
                                    Get.back();
                                  },
                                  child: Chip(
                                    visualDensity: const VisualDensity(
                                        vertical: -3, horizontal: 0),
                                    label: TextWidget(
                                        budgetSummaryController
                                            .dateRangeItem[i],
                                        fontSize: 10.sp,
                                        color: budgetSummaryController
                                                    .incomeBudgetSelectedItem
                                                    .value ==
                                                budgetSummaryController
                                                    .dateRangeItem[i]
                                            ? AppColor.whiteColor
                                            : context.theme.textTheme
                                                .titleMedium!.color),
                                    backgroundColor: budgetSummaryController
                                                .incomeBudgetSelectedItem
                                                .value ==
                                            budgetSummaryController
                                                .dateRangeItem[i]
                                        ? SaprateLightDarkColor.greenLightColor
                                        : context.theme.primaryColor,
                                    side: BorderSide(
                                        color: budgetSummaryController
                                                    .incomeBudgetSelectedItem
                                                    .value ==
                                                budgetSummaryController
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
                      title: budgetSummaryController
                          .incomeBudgetSelectedItem.value),
                ),
              ),
              // Obx(
              //   () => CustomDropdownButtonWithList(
              //     dropDownList: budgetSummaryController.tempItemsList,
              //     onChanged: (String? value) {
              //       budgetSummaryController.tempSelectedValue2.value = value!;
              //     },
              //     value: budgetSummaryController.tempSelectedValue2.value,
              //     hint: '',
              //   ),
              // ),
            ],
          ).marginOnly(bottom: 5),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings:
                          const RouteSettings(name: Routes.budgetDetailScreen),
                      screen: BudgetDetailScreen(
                          budgetDetailName:
                              budgetSummaryController.spendBudgetList[index]),
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
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
                                Container(
                                  height: 43,
                                  width: 43,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueGrey.shade100,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        AssetIcons.appIcon,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      budgetSummaryController
                                          .spendBudgetList[index],
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextWidget("\$699",
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: context.theme.textTheme
                                            .titleMedium!.color),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 20,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextWidget("\$300 remaining",
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                    color: context
                                        .theme.textTheme.titleMedium!.color),
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
                              progressColor: budgetSummaryController
                                  .progressBarColor[index],
                              backgroundColor: budgetSummaryController
                                  .progressBarColor[index]
                                  .withOpacity(0.2),
                              currentValue: 80,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(
            height: 5.h,
          ),
          Container(
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
                          TextWidget("Total",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color:
                                  context.theme.textTheme.titleMedium!.color),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWidget("\$699",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color:
                                  context.theme.textTheme.titleMedium!.color),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextWidget("\$300 remaining",
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                          color: context.theme.textTheme.titleMedium!.color),
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
                    progressColor: AppColor.redColor,
                    backgroundColor: AppColor.redColor.withOpacity(0.2),
                    currentValue: 80,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              TextWidget(
                "Spend vs Budget",
                fontSize: 16.sp,
                color: context.theme.textTheme.titleMedium!.color,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
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
                                      budgetSummaryController
                                          .dateRangeItem.length;
                                  i++)
                                GestureDetector(
                                  onTap: () {
                                    budgetSummaryController
                                            .spendBudgetSelectedItem.value =
                                        budgetSummaryController
                                            .dateRangeItem[i];
                                    Get.back();
                                  },
                                  child: Chip(
                                    visualDensity: const VisualDensity(
                                        vertical: -3, horizontal: 0),
                                    label: TextWidget(
                                        budgetSummaryController
                                            .dateRangeItem[i],
                                        fontSize: 10.sp,
                                        color: budgetSummaryController
                                                    .spendBudgetSelectedItem
                                                    .value ==
                                                budgetSummaryController
                                                    .dateRangeItem[i]
                                            ? AppColor.whiteColor
                                            : context.theme.textTheme
                                                .titleMedium!.color),
                                    backgroundColor: budgetSummaryController
                                                .spendBudgetSelectedItem
                                                .value ==
                                            budgetSummaryController
                                                .dateRangeItem[i]
                                        ? SaprateLightDarkColor.greenLightColor
                                        : context.theme.primaryColor,
                                    side: BorderSide(
                                        color: budgetSummaryController
                                                    .spendBudgetSelectedItem
                                                    .value ==
                                                budgetSummaryController
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
                      title: budgetSummaryController
                          .spendBudgetSelectedItem.value),
                ),
              ),
              // Obx(
              //   () => CustomDropdownButtonWithList(
              //     dropDownList: budgetSummaryController.tempItemsList,
              //     onChanged: (String? value) {
              //       budgetSummaryController.tempSelectedValue2.value = value!;
              //     },
              //     value: budgetSummaryController.tempSelectedValue2.value,
              //     hint: '',
              //   ),
              // ),
            ],
          ).marginOnly(bottom: 5),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: context.theme.primaryColor,
                        boxShadow: [commonBoxshdow()],
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          PersistentNavBarNavigator
                              .pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(
                                name: Routes.budgetDetailScreen),
                            screen: BudgetDetailScreen(
                                budgetDetailName: budgetSummaryController
                                    .spendBudgetList[index]),
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 43,
                                  width: 43,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueGrey.shade100,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        AssetIcons.appIcon,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      budgetSummaryController
                                          .spendBudgetList[index],
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextWidget("\$699",
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: context.theme.textTheme
                                            .titleMedium!.color),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 20,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextWidget("\$300 remaining",
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                    color: context
                                        .theme.textTheme.titleMedium!.color),
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
                              progressColor: budgetSummaryController
                                  .progressBarColor[index],
                              backgroundColor: budgetSummaryController
                                  .progressBarColor[index]
                                  .withOpacity(0.2),
                              currentValue: 80,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(
            height: 5.h,
          ),
          Container(
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
                          TextWidget("Total",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color:
                                  context.theme.textTheme.titleMedium!.color),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWidget("\$699",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color:
                                  context.theme.textTheme.titleMedium!.color),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextWidget("\$300 remaining",
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                          color: context.theme.textTheme.titleMedium!.color),
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
                    progressColor: AppColor.redColor,
                    backgroundColor: AppColor.redColor.withOpacity(0.2),
                    currentValue: 80,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          TextWidget(
            "Achieved Goals Budget",
            fontSize: 16.sp,
            color: context.theme.textTheme.titleMedium!.color,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 1.h,
          ),
          InkWell(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                context,
                settings:
                    const RouteSettings(name: Routes.editYourGoalBudgetScreen),
                screen: const EditYourGoalBudgetScreen(),
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.orangeAccentColor,
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
                            TextWidget("Goal 1 - Holiday",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: context.theme.primaryColor),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget("\$699",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: context.theme.primaryColor),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: context.theme.primaryColor,
                          size: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextWidget("\$10 left",
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                            color: context.theme.primaryColor),
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
                      progressColor: AppColor.brownDarkColor,
                      backgroundColor: AppColor.whiteColor.withOpacity(0.4),
                      currentValue: 80,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
