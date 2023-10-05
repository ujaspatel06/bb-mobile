import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/common_chip.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class IncomevsExpensesGraph extends StatefulWidget {
  const IncomevsExpensesGraph({super.key});


  @override
  State<IncomevsExpensesGraph> createState() => _IncomevsExpensesGraphState();
}

class _IncomevsExpensesGraphState extends State<IncomevsExpensesGraph> {
  DashBoardController dashBoardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return isLoading?_shimmerIncomeExpensesGraph():Column(
      children: [
        Row(
          children: [
            TextWidget(
              "Income vs Expenses",
              fontSize: 16.sp,
              color: context.theme.textTheme.titleMedium!.color,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            if (!dashBoardController.isWidegetHide("Income vs expenses graph"))
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
                                            .dateRangeMonthItem.length;
                                    i++)
                                  GestureDetector(
                                    onTap: () {
                                      dashBoardController
                                              .incomeExpenseGraphSelectedItem
                                              .value =
                                          dashBoardController
                                              .dateRangeMonthItem[i];
                                      Get.back();
                                    },
                                    child: Chip(
                                      visualDensity: const VisualDensity(
                                          vertical: -3, horizontal: 0),
                                      label: TextWidget(
                                          dashBoardController
                                              .dateRangeMonthItem[i],
                                          fontSize: 10.sp,
                                          color: dashBoardController
                                                      .incomeExpenseGraphSelectedItem
                                                      .value ==
                                                  dashBoardController
                                                      .dateRangeMonthItem[i]
                                              ? AppColor.whiteColor
                                              : context.theme.textTheme
                                                  .titleMedium!.color),
                                      backgroundColor: dashBoardController
                                                  .incomeExpenseGraphSelectedItem
                                                  .value ==
                                              dashBoardController
                                                  .dateRangeMonthItem[i]
                                          ? SaprateLightDarkColor
                                              .greenLightColor
                                          : context.theme.primaryColor,
                                      side: BorderSide(
                                          color: dashBoardController
                                                      .incomeExpenseGraphSelectedItem
                                                      .value ==
                                                  dashBoardController
                                                      .dateRangeMonthItem[i]
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
                  child: Obx(() => CommonChip(
                      title: dashBoardController
                          .incomeExpenseGraphSelectedItem.value)))
            //  Obx(
            //   () => CustomDropdownButtonWithList(
            //     dropDownList: dashBoardController.tempItemsList,
            //     onChanged: (String? value) {
            //       dashBoardController.tempSelectedValue2.value = value!;
            //     },

            //     value: dashBoardController.tempSelectedValue2.value,
            //   ),
            // ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          // height: 200,
          decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [commonBoxshdow(blurRadius: 20)]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  "April 2022",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: context.theme.textTheme.titleMedium!.color,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    TextWidget(
                      "Income: ",
                      fontSize: 12.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w600,
                    ),
                    TextWidget(
                      "\$1890",
                      fontSize: 14.sp,
                      color: box.read(GetStorageKey.themeMode) ?? false
                          ? SaprateLightDarkColor.cyanColor
                          : SaprateLightDarkColor.greenLightColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    TextWidget(
                      "Expenses: ",
                      fontSize: 12.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w600,
                    ),
                    TextWidget(
                      "\$1890",
                      fontSize: 14.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  height: 200,
                  child: BarChart(
                    BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.transparent,
                          // getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          //   return BarTooltipItem(
                          //       "", const TextStyle(color: Colors.black));
                          // },
                          tooltipMargin: 0,
                        ),
                        touchCallback: (FlTouchEvent event, barTouchResponse) {
                          if (!event.isInterestedForInteractions ||
                              barTouchResponse == null ||
                              barTouchResponse.spot == null) {
                            setState(() {
                              dashBoardController.touchedIndex = -1;
                            });
                            return;
                          }
                          final rodIndex =
                              barTouchResponse.spot!.touchedRodDataIndex;
                          if (dashBoardController.isShadowBar(rodIndex)) {
                            setState(() {
                              dashBoardController.touchedIndex = -1;
                            });
                            return;
                          }
                          setState(() {
                            dashBoardController.touchedIndex =
                                barTouchResponse.spot!.touchedBarGroupIndex;
                          });
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 28,
                            getTitlesWidget: bottomTitles,
                          ),
                        ),
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                            reservedSize: 40,
                          ),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: const FlGridData(
                        show: true,
                        drawHorizontalLine: false,
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      groupsSpace: 5,
                      barGroups: DashBoardController.mainItems.entries
                          .map(
                            (e) => dashBoardController.generateGroup(
                              e.key,
                              e.value[0],
                              e.value[1],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: box.read(GetStorageKey.themeMode) ?? false
                            ? SaprateLightDarkColor.cyanColor
                            : SaprateLightDarkColor.greenLightColor,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    TextWidget(
                      "Income",
                      fontSize: 10.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    TextWidget(
                      "Expenses",
                      fontSize: 10.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: context.theme.textTheme.titleMedium!.color);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'J';
        break;
      case 1:
        text = 'F';
        break;
      case 2:
        text = 'M';
        break;
      case 3:
        text = 'A';
        break;
      case 4:
        text = 'M';
        break;
      case 5:
        text = 'J';
        break;
      case 6:
        text = 'J';
        break;
      case 7:
        text = 'O';
        break;
      case 8:
        text = 'S';
        break;
      case 9:
        text = 'O';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget _shimmerIncomeExpensesGraph()
  {
    return  Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(

        children: [
          Row(
            children: [
              Container(height: 24,width: 150, decoration: ShapeDecoration(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),),
              Spacer(),
              CommonChip(title: "title")
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: 330,
            decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(30),
               ),
          ),
        ],
      ),
    );
  }
}
