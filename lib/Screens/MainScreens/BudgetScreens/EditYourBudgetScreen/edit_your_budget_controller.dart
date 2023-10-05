// ignore_for_file: empty_catches

import 'package:budget_buddie/Data/Models/expenses_model.dart';
import 'package:budget_buddie/Data/Models/incomes_model.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/EditYourBudgetScreen/edit_your_budget_repository.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditYourBudgetController extends GetxController {
  var isLoading = true.obs;
  RxInt totalIncomeValue = 0.obs;
  RxInt totalExpenseValue = 0.obs;

  EditYourBudgetRepository editYourBudgetRepository =
      EditYourBudgetRepository();

  RxList<Incomes> incomesList = <Incomes>[].obs;
  RxList<Expenses> expensesList = <Expenses>[].obs;

  @override
  void onInit() {
    getIncomeList();
    getExpenseList();
    super.onInit();
  }

  Future getIncomeList({bool isLoaderShow = true}) async {
    try {
      isLoading.value = true;
      var token = GetStorage().read(GetStorageKey.USER_INFO) ?? '{}' as Map;
      incomesList.clear();
      totalIncomeValue.value = 0;
      var response = await editYourBudgetRepository.getIncomesList(
          token["userUuid"].toString(),
          isLoaderShow: isLoaderShow);

      if (response.incomes != null) {
        List<Incomes> incomes = <Incomes>[];
        incomes.addAll(response.incomes!);
        incomesList.addAll(incomes.reversed);

        for (var value in incomesList) {
          totalIncomeValue.value =
              (value.incomeAmount ?? 0) + totalIncomeValue.value;
        }
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    } finally {
      isLoading.value = false;
    }
  }

  Future getExpenseList({bool isLoaderShow = true}) async {
    try {
      isLoading.value = true;
      var token = GetStorage().read(GetStorageKey.USER_INFO) as Map;
      expensesList.clear();
      totalExpenseValue.value = 0;
      var response = await editYourBudgetRepository.getExpensesList(
          token["userUuid"].toString(),
          isLoaderShow: isLoaderShow);
      if (response.expenses != null) {
        List<Expenses> expenses = <Expenses>[];
        expenses.addAll(response.expenses!);
        expensesList.addAll(expenses.reversed);

        for (var value in expensesList) {
          totalExpenseValue.value =
              (value.expenseAmount ?? 0) + totalExpenseValue.value;
        }
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    } finally {
      isLoading.value = false;
    }
  }
}
