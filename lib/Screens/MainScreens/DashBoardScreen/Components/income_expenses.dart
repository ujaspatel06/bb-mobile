// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class IncomeExpenses extends StatefulWidget {
  const IncomeExpenses({super.key});

  @override
  State<IncomeExpenses> createState() => _IncomeExpensesState();
}

class _IncomeExpensesState extends State<IncomeExpenses> {
  DashBoardController dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _shimmerIncomeExpense()
        : Obx(
            () => Column(children: [
              Container(
                // height: 75,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: context.theme.colorScheme.primaryContainer,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15)),
                        child: SvgPicture.asset(
                          AssetSvgs.vectorItem,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(15)),
                          child: SvgPicture.asset(AssetSvgs.vectorItem2)),
                    ),
                    InkWell(
                      onTap: () {
                        dashBoardController.isShowIncomeExpenses.value =
                            !dashBoardController.isShowIncomeExpenses.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18.0, horizontal: 18),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RotatedBox(
                              quarterTurns: 2,
                              child: SvgPicture.asset(
                                AssetSvgs.upDownIcon,
                                height: 26,
                                color: AppColor.greenAssentColor,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  "Income",
                                  color: AppColor.whiteColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextWidget(
                                  "\$ 20,000",
                                  color: AppColor.whiteColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            const VerticalDivider(
                              color: AppColor.whiteColor,
                              thickness: 1,
                            ),
                            SvgPicture.asset(
                              AssetSvgs.upDownIcon,
                              height: 26,
                              color: AppColor.redColor,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  "Expenses",
                                  color: AppColor.whiteColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextWidget(
                                  "\$ 20,000",
                                  color: AppColor.whiteColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (dashBoardController.isShowIncomeExpenses.value) ...[
                const SizedBox(
                  height: 10,
                ),
                AnimationLimiter(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        mainAxisExtent: 7.h),
                    itemCount: dashBoardController.incomeExpensesList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 300),
                        child: FadeInAnimation(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: context.theme.primaryColor,
                                boxShadow: [commonBoxshdow()],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, bottom: 12, left: 8, right: 8),
                              child: Row(
                                children: [
                                  TextWidget(
                                    "${dashBoardController.incomeExpensesList[index]}",
                                    fontSize: 13.sp,
                                    color: context
                                        .theme.textTheme.titleMedium!.color,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const Spacer(),
                                  Obx(
                                    () => SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: CupertinoSwitch(
                                          onChanged: (bool value) {
                                            dashBoardController
                                                .isIncomeExpenseSwitch
                                                .value = value;
                                          },
                                          value: dashBoardController
                                              .isIncomeExpenseSwitch.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ]),
          );
  }

  Widget _shimmerIncomeExpense() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      // direction: ShimmerDirection.ltr,
      // loop: 1,
      enabled: true,
      child: Column(
        children: [
          Container(
            // width: 100.w,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
