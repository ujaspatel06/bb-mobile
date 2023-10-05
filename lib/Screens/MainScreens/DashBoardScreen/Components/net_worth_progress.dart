import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class NetWorthProgress extends StatefulWidget {
  const NetWorthProgress({super.key});

  @override
  State<NetWorthProgress> createState() => _NetWorthProgressState();
}

class _NetWorthProgressState extends State<NetWorthProgress> {
  DashBoardController dashBoardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return isLoading?_shimmerNetWorthProgress():Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        TextWidget(
          "Net worth progress",
          fontSize: 16.sp,
          color: context.theme.textTheme.titleMedium!.color,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 270,
          decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [commonBoxshdow(blurRadius: 30)]),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          "Net worth progress",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: context.theme.textTheme.titleMedium!.color,
                        ),
                        const Spacer(),
                        TextWidget(
                          "\$13,780",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.greenAssentColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      "May 2022",
                      fontSize: 12.sp,
                      color: AppColor.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 150,
                    child: LineChart(
                      mainData(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
         const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: const LineTouchData(
          touchTooltipData: LineTouchTooltipData(
              showOnTopOfTheChartBoxArea: false,
              tooltipBgColor: Colors.transparent)),
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.red,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.red,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: const FlTitlesData(
        show: false,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        // bottomTitles: AxisTitles(
        //   sideTitles: SideTitles(
        //     showTitles: false,
        //     reservedSize: 30,
        //     interval: 1,
        //     getTitlesWidget: bottomTitleWidgets,
        //   ),
        // ),
        // leftTitles: AxisTitles(
        //   sideTitles: SideTitles(
        //     showTitles: false,
        //     interval: 1,
        //     getTitlesWidget: leftTitleWidgets,
        //     reservedSize: 42,
        //   ),
        // ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: Colors.green.shade600,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.green.shade600.withOpacity(0.2),
          ),
        ),
      ],
    );
  }


  Widget _shimmerNetWorthProgress()
  {
    return  Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 24,width: 150, decoration: ShapeDecoration(
            color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),),
          SizedBox(height: 10,),
          Container(
            height: 330,
            decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(30),),
          ),
        ],
      ),
    );
  }
}
