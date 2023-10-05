import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetSummaryController extends GetxController {
  List<Color> progressBarColor = [
    AppColor.amberDarkColor,
    SaprateLightDarkColor.greenLightColor,
    AppColor.blueLightColor,
    AppColor.yellowLightColor,
  ];

  RxList dateRangeItem = [
    'This week',
    'This month',
    'This quarter',
    'This year',
  ].obs;


  RxString incomeBudgetSelectedItem = "This week".obs;
  RxString spendBudgetSelectedItem = "This week".obs;

  RxMap<String, String> dropIncomeBudgetItem = {
    "This week": "This week",
    "This quarter": "This quarter",
    "This year": "This year",
    "Last week": "Last week",
    "Last month": "Last month",
  }.obs;

    final RxList<String> spendBudgetList = [
    'Pay',
    'Rental Income',
    'Investments',
    'Other',
    'Eating out',
    'Events',
  ].obs;

  final RxList<String> tempItemsList = [
    'Week',
    'Month',
    'Year',
    '1 Year',
    '10 Year',
  ].obs;
  RxString tempSelectedValue2 = 'Week'.obs;
}
