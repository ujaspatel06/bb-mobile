// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Data/Models/cash_account_model.dart';
import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/AddCashAccount/add_cash_account_screen.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class AccountDetailScreen extends StatefulWidget {
  const AccountDetailScreen({super.key,  this.accounts, required this.routesName});

  final Accounts? accounts;
  final String routesName;

  @override
  State<AccountDetailScreen> createState() => _AccountDetailScreenState();
}

class _AccountDetailScreenState extends State<AccountDetailScreen> {
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
              ))
        ],
        titleWidget: TextWidget(
          "Account detail",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 175,
            decoration: BoxDecoration(
              boxShadow: [commonBoxshdow(blurRadius: 30)],
              borderRadius: BorderRadius.circular(15),
              color: context.theme.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            "Savings Account",
                            color: context.theme.textTheme.titleMedium!.color,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWidget(
                            "\$ ${widget.accounts?.value ?? 12000}",
                            color: context.theme.textTheme.titleMedium!.color,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                          height: 55,
                          width: 55,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: context.theme.canvasColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(AssetIcons.appIcon)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        "Account number",
                        color: context.theme.textTheme.titleMedium!.color,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          TextWidget(
                            "1234   4567   8546   8452",
                            color: context.theme.textTheme.titleMedium!.color,
                            fontSize: 8.5.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          InkWell(
                            onTap: () async {
                              await Clipboard.setData(const ClipboardData(
                                  text: "1234   4567   8546   8452"));

                              Fluttertoast.showToast(
                                  msg: "Copied",
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 15);
                            },
                            child: SvgPicture.asset(
                              AssetSvgs.copyIcon,
                              height: 17,
                              color: AppColor.greyColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: 6.h,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [commonBoxshdow(blurRadius: 30)],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: AppColor.darkBlueColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              "Name",
                              color: AppColor.whiteColor,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            TextWidget(
                              "Tim Preston",
                              color: AppColor.whiteColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                          ]),
                      IconButton(onPressed: (){
                        PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                          context,

                          settings:
                          const RouteSettings(name: Routes.addCashAccountScreen),
                          screen:  AddCashAccountScreen(accounts: widget.accounts,routesName: widget.routesName),
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      }, icon: const Icon(Icons.edit_rounded,color: AppColor.whiteColor,))
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 270,
            decoration: BoxDecoration(
                color: context.theme.primaryColor,

                borderRadius: BorderRadius.circular(30),
                boxShadow: [commonBoxshdow(blurRadius: 30)]),
            child: Stack(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            "Balance over time",
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
                        height: 8,
                      ),
                      TextWidget(
                        "Week 5 - 12/11/2022",
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
            height: 40,
          ),
          TextWidget(
            "Transactions",
            fontSize: 16.sp,
            color: context.theme.textTheme.titleMedium!.color,
            fontWeight: FontWeight.w600,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: context.theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [commonBoxshdow(blurRadius: 30)],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
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
                              TextWidget("Countdown",
                                  fontWeight: FontWeight.w600,
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontSize: 13.sp),
                              const SizedBox(
                                height: 4,
                              ),
                              TextWidget("Groceries - Today",
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.greyColor,
                                  fontSize: 12.sp),
                            ],
                          ),
                          const Spacer(),
                          TextWidget("\$352.00",
                              fontWeight: FontWeight.w600,
                              color: AppColor.redColor,
                              fontSize: 12.sp),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ]),
      )),
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
        border: Border.all(color: const Color(0xff37434d)),
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
}
