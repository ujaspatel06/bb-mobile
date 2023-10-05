import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BudgetDetailController extends GetxController {
  final RxMap<Color, String> pickColorItemList = {
    AppColor.pickRedColor: 'Red',
    AppColor.pickLightGreenColor: 'Light green',
    AppColor.pickBlueColor: 'Blue',
    AppColor.pickGreenColor: 'Green',
    AppColor.pickYellowColor: 'Yellow',
    AppColor.pickLightBlueColor: 'Light blue',
    AppColor.pickOrangeColor: 'Orange',
    AppColor.pickPinkColor: 'Pink',
    AppColor.pickPurpleColor: 'Purple',
  }.obs;

  RxString imageName = ''.obs;
  RxString imagePath = ''.obs;

  final GlobalKey<FormState> budgetDetailKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController lastPayDateController = TextEditingController();
  TextEditingController emojiController = TextEditingController();

  final RxMap<String, String> howOftenItems = {
    'Weekly': 'Weekly',
    'Fortnightly': 'Fortnightly',
    'Monthly': 'Monthly',
  }.obs;

  final RxList<String> tempItemsList = [
    'Week',
    'Month',
    'Year',
    '1 Year',
    '10 Year',
  ].obs;

  RxList dateRangeItem = [
    'This week',
    'This month',
    'This quarter',
    'This year',
  ].obs;

  RxList dateRangeGraphItem = [
    'Weekly',
    'Monthly',
    'Quarterly',
    'Annually',
  ].obs;

  Rx<Color> pickSelectedColor = AppColor.pickRedColor.obs;
  RxString pickSelectedColorName = 'Red'.obs;
  RxString howOftenSelectedVal = 'Weekly'.obs;
  RxString incomeBudgetSelectedItem = "This week".obs;
  RxString incomeBudgetGraphSelectedItem = "Weekly".obs;

  int touchedIndex = -1;
  static double barWidth = 6.5.w;
  static const shadowOpacity = 0.2;
  bool isShadowBar(int rodIndex) => rodIndex == 1;
  static const mainItems = <int, List<double>>{
    0: [2, 8],
    1: [2, 5],
    2: [3, 10],
    3: [5, 10],
    4: [6, 8],
    5: [3, 5],
    6: [2, 7],
    7: [3, 10],
    8: [4, 9],
    9: [3, 6],
  };

  BarChartGroupData generateGroup(
    int x,
    double value1,
    double value2,
  ) {
    final sum = value1 + value2;
    final isTouched = touchedIndex == x;
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: isTouched ? [0] : [],
      barRods: [
        BarChartRodData(
          toY: sum,
          width: barWidth,
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              value1,
              box.read(GetStorageKey.themeMode)
                  ? AppColor.redColor
                  : AppColor.pinkLightColor,
              BorderSide(
                color: box.read(GetStorageKey.themeMode)
                    ? AppColor.blackColor
                    : AppColor.whiteColor,
                width: isTouched ? 2 : 0,
              ),
            ),
            BarChartRodStackItem(
              value1,
              value1 + value2,
              box.read(GetStorageKey.themeMode)
                  ? SaprateLightDarkColor.cyanColor
                  : SaprateLightDarkColor.greenLightColor,
              BorderSide(
                color: box.read(GetStorageKey.themeMode)
                    ? AppColor.blackColor
                    : AppColor.whiteColor,
                width: isTouched ? 2 : 0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
