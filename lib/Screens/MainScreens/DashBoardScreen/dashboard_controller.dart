import 'dart:convert';

import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'Components/account_balance.dart';
import 'Components/expenses_breakdown.dart';
import 'Components/goals.dart';
import 'Components/income_breakdown.dart';
import 'Components/income_expenses_graph.dart';
import 'Components/merchants.dart';
import 'Components/net_worth_progress.dart';
import 'Components/spend_budget.dart';
import 'Components/top_5_expenses.dart';
import 'Components/top_5_merchants.dart';
import 'Components/transaction.dart';
import 'Components/weekly_cashflow.dart';

class DashBoardController extends GetxController {
  List<Color> dashboardGridColor = [
    AppColor.amberDarkColor,
    SaprateLightDarkColor.greenLightColor,
    AppColor.blueLightColor,
    AppColor.yellowLightColor,
    AppColor.pinkLightColor,
    AppColor.blueLightColor
  ];

  RxBool isShowSpendBudget = false.obs;
  RxBool isShowIncomeExpenses = false.obs;
  RxBool isBalanceDetail = false.obs;
  RxBool isBalanceDetailSwitch = false.obs;
  RxBool isIncomeExpenseSwitch = false.obs;
  RxDouble totalBreakDownIncomw = 5000.0.obs;

  RxList dateRangeItem = [
    'This week',
    'This month',
    'This quarter',
    'This year',
  ].obs;

  RxList dateRangeMonthItem = [
    'Last 3 months',
    'Last 6 months',
    'Last 12 months',
  ].obs;

  RxString top5ExpensesSelectedItem = 'This week'.obs;
  RxString spendBudgetSelectedItem = 'This week'.obs;
  RxString top5MerchantSelectedItem = 'This week'.obs;
  RxString incomeExpenseGraphSelectedItem = 'Last 3 months'.obs;

  List<String> expenseBreakDownType = <String>[
    "Food",
    "Power/Wifi",
    "Insurance",
    "Mortgage",
    "Car",
    "Rates",
    "Eating out",
    "Clothes",
  ];

  List<double> expenseBreakDownHeight = <double>[
    4500,
    3000,
    4000,
    3000,
    3500,
    5000,
    4500,
    2800
  ];

  RxInt selectedType = 1.obs;


  double getBreakDownIncomeHeight(double value) {
    // double percentage = (value * 100) / totalBreakDownIncomw.value;
    double getHeight = (140 * value) / totalBreakDownIncomw.value;
    update();

    return getHeight;
  }

  double getBreakDownExpensesHeight(double value) {
    // double percentage = (value * 100) / totalBreakDownIncomw.value;
    double getHeight = (160 * value) / totalBreakDownIncomw.value;
    update();
    return getHeight;
  }

  RxMap<String, Widget> allWidgetsList = {
    // 'Total Balance': const TotalBalance(),
    // 'Income vs expenses': const IncomeExpenses(),
    'Top 5 expenses': const Top5Expenses(),
    'Spend vs budget': const SpendvsBudget(),
    'Transaction': const Transaction(),
    'Income vs expenses graph': const IncomevsExpensesGraph(),
    'Goals': const Goals(),
    'Merchants': const Merchants(),
    'Weekly Cashflow': const CashFlowLineChart(),
    'Account balances': const AccountBalance(),
    'Income breakdown': const IncomeBreakdown(),
    'Expenses breakdown': const ExpensesBreakdown(),
    'Net worth progress': const NetWorthProgress(),
    'Top 5 Merchants': const Top5Merchants()
  }.obs;

  RxList<Map<String, Widget>> showWidgetsList = [<String, Widget>{}].obs;
  RxList<Map<String, Widget>> hideWidgetsList = [<String, Widget>{}].obs;

  RxList incomeExpensesList = [
    "This week",
    "This month",
    "This year",
    "Last week",
    "Last month",
    "Last year",
  ].obs;

  final RxList<String> tempItemsList = [
    'This Week',
    'This Month',
    'This Year',
    '1 Year',
    '10 Year',
  ].obs;
  final RxList<String> spendBudgetList = [
    'Groceries',
    'Clothes',
    'Car',
    'House',
    'Eating out',
    'Events',
  ].obs;
  RxString tempSelectedValue2 = 'This Week'.obs;

  bool isWidegetHide(String name) {
    bool isHide = false;
    for (var i in hideWidgetsList) {
      if (i.keys.first == name) {
        isHide = true;
      }
    }
    update();
    return isHide;
  }

  getEditedWidgets() async {
    showWidgetsList.clear();
    hideWidgetsList.clear();
    var editedList = await box.read(GetStorageKey.editsWidgets);
    if (editedList == null) {
      for (var element in allWidgetsList.keys) {
        showWidgetsList.add({element: allWidgetsList[element]!});
      }
    } else {
      List<String> jsonList = List<String>.from(jsonDecode(editedList));
      for (var element in jsonList) {
        showWidgetsList.add({element: allWidgetsList[element]!});
      }
      for (var i in allWidgetsList.keys) {
        if (!jsonList.contains(i)) {
          hideWidgetsList.add({i: allWidgetsList[i]!});
        }
      }
    }
  }

  onDisposeUpdateList() {
    List<String> editedWidgetList = [];
    for (var i in showWidgetsList) {
      editedWidgetList.add(i.keys.first);
    }
    String jsonString = jsonEncode(editedWidgetList);
    box.write(GetStorageKey.editsWidgets, jsonString);
  }

  Widget bottomTitles(double value, TitleMeta meta, BuildContext context) {
    TextStyle style = TextStyle(
        fontSize: 10,
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

  RxInt getBalance = 0.obs;

  void getTotal() {
    getBalance.value = 0;
    for (var i in totalBalance) {
      if (i.isTotalBalance == true) {
        getBalance = getBalance + int.parse(i.value!);
      }
    }
  }

  RxList<TotalBalanceModel> totalBalance = <TotalBalanceModel>[].obs;

  RxList temptotalBalance = [
    {
      "title": "Everyday account",
      "value": "1000",
      "isTotalBalance": true,
    },
    {
      "title": "Groceries",
      "value": "2000",
      "isTotalBalance": true,
    },
    {
      "title": "Power & Wifi",
      "value": "2400",
      "isTotalBalance": true,
    },
    {
      "title": "Mortgage",
      "value": "4500",
      "isTotalBalance": true,
    },
    {
      "title": "Savings",
      "value": "1500",
      "isTotalBalance": true,
    },
    {
      "title": "Credit Card",
      "value": "4200",
      "isTotalBalance": true,
    },
    {
      "title": "Sharesies",
      "value": "1500",
      "isTotalBalance": true,
    },
    {
      "title": "Kiwisaver",
      "value": "5000",
      "isTotalBalance": true,
    },
  ].obs;

  List bankImages = [
    [
      "TSB Bank",
      "https://play-lh.googleusercontent.com/6uqtf4q2hmHvHv07UA6NDyYOaq3pIuHj3j1TTjM1Y8xIsGMJ0QMqhiqjnkbnFEiCrZyZ"
    ],
    [
      "Kiwibank",
      "https://play-lh.googleusercontent.com/beZXQGHskyXBOEl3A8iA-IVkhacbaErYdq6zmhPaJ2LOjwHhCqK4IhO7KeLl4iIGaFM"
    ],
    [
      "BNZ Bank",
      "https://play-lh.googleusercontent.com/4pWiMbstGNFa7mywYKXidZM00DSrbQ9j52cF0igMiEDGSay0JDfRMutvzGOmwc02jfU"
    ],
    [
      "Westpac",
      "https://play-lh.googleusercontent.com/jMur6g2XRBF3fQj_VloyhmCSXy7TlRk5FEfD6MWPYmH_QmA6UC1MVzfHODWTxfY7P4M=w240-h480-rw"
    ],
    [
      "ANZ Bank",
      "https://play-lh.googleusercontent.com/EM8phjm9ha---T5Kwtbf3fFcC-6KJyLz8mzr75e4I7jkfSqJWJyNsgST0ThH_GV4sSTY"
    ],
    [
      "Cooperative bank",
      "https://play-lh.googleusercontent.com/ckUBnit4WEAo9UqJ0L1lmDAyxzDlg7r1eB2REC7aP4TavnRIv_jaPA2C0ct600JQFuw"
    ],
    [
      "ASB Bank",
      "https://play-lh.googleusercontent.com/faVTk0TwaIGkJv6R2AvAUiD93PmM682QdwQr-5p8R800cCEWT9ddIq7KsmlRy7Xf8Q"
    ],
    [
      "Rabobank",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM8MRu2sEgNur2HV5Df5hGpghHWUxF9RVFIvHKh5oNLE_CFigsmkz3KpxF46gn0xQ4cj0&usqp=CAU"
    ],
  ];

  RxBool load = false.obs;
  @override
  void onInit() {
    totalBalance.value = temptotalBalance
        .map((payment) => TotalBalanceModel.fromJson(payment))
        .toList();
    getEditedWidgets();
    getTotal();
    Future.delayed(Duration(seconds: 5),(){
      load.value  =  true;
    });
    super.onInit();
  }
}

// Class For  a Dynamic Total Balance


class TotalBalanceModel {
  String? title;
  String? value;
  bool? isTotalBalance;

  TotalBalanceModel({this.title, this.value, this.isTotalBalance});

  TotalBalanceModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
    isTotalBalance = json['isTotalBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['value'] = value;
    data['isTotalBalance'] = isTotalBalance;
    return data;
  }
}
