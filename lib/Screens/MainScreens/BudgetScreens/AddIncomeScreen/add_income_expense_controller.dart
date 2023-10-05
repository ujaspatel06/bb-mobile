// ignore_for_file: use_build_context_synchronously

import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/AddIncomeScreen/add_income_expence_repository.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/EditYourBudgetScreen/edit_your_budget_controller.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddIncomeExpenseController extends GetxController {
  final RxMap<String, String> howOftenItems = {
    'Weekly': 'Weekly',
    'Fortnightly': 'Fortnightly',
    'Monthly': 'Monthly',
  }.obs;
  RxString howOftenSelectedVal = 'Weekly'.obs;

  final RxMap<String, String> incomeTypeItems = {
    'Pay': 'Pay',
    'Rental Income': 'Rental Income',
    'Investments': 'Investments',
    'Other': 'Other',
  }.obs;
  RxString incomeTypeSelectedValue = 'Pay'.obs;
  RxString accountsSelectedItems = ''.obs;

  TextEditingController incomeNameController = TextEditingController();
  TextEditingController incomeAmountController = TextEditingController();
  // TextEditingController incomeAccAccountController = TextEditingController();
  TextEditingController incomeLastPayDayDate = TextEditingController();

  final GlobalKey<FormState> addIncomeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addExpenseFormKey = GlobalKey<FormState>();

  var isLoading = false.obs;
  AddIncomeExpenseRepository addIncomeExpenseRepository =
      AddIncomeExpenseRepository();
  EditYourBudgetController editYourBudgetController = Get.find();

  addIncome(BuildContext context) async {
    if (addIncomeFormKey.currentState!.validate() && !isLoading.value) {
      // TODO: INCOME ADD
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addIncomeExpenseRepository.addIncome({
          "userUuid": userInfo["userUuid"].toString(),
          "incomeType": incomeTypeSelectedValue.value,
          "incomeName": incomeNameController.text,
          "incomeAmount": incomeAmountController.text,
          "lastPaymentDate": incomeLastPayDayDate.text,
          "howOften": howOftenSelectedVal.value,
          "accountAssociated": accountsSelectedItems.value,
        });

        if (response.code == 1) {
          // SnackBars.successSnackBar(content: response.message!);
          await editYourBudgetController.getIncomeList(isLoaderShow: false);
          Navigator.pop(context);

        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  updateIncome(BuildContext context, String id) async {
    if (addIncomeFormKey.currentState!.validate() && !isLoading.value) {
      // TODO: INCOME ADD
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addIncomeExpenseRepository.updateIncome({
          "userUuid": userInfo["userUuid"].toString(),
          "incomeUuid": id,
          "incomeType": incomeTypeSelectedValue.value,
          "incomeName": incomeNameController.text,
          "incomeAmount": incomeAmountController.text,
          "lastPaymentDate": incomeLastPayDayDate.text,
          "howOften": howOftenSelectedVal.value,
          "accountAssociated": accountsSelectedItems.value,
        });

        if (response.code == 1) {
          // SnackBars.successSnackBar(content: response.message!);
          await editYourBudgetController.getIncomeList(isLoaderShow: false);
          Navigator.pop(context);

        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> deleteIncome(BuildContext context, String id) async {
    if (!isLoading.value) {
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addIncomeExpenseRepository
            .deleteIncome('${userInfo["userUuid"].toString()}/$id');
        if (response.code == 1) {

          // SnackBars.successSnackBar(content: response.message!);
          await editYourBudgetController.getIncomeList(isLoaderShow: false);
          Navigator.pop(context);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  addExpense(BuildContext context) async {
    if (addExpenseFormKey.currentState!.validate() && !isLoading.value) {
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addIncomeExpenseRepository.addExpense({
          "userUuid": userInfo["userUuid"].toString(),
          "expenseType": incomeTypeSelectedValue.value,
          "expenseAmount": incomeAmountController.text,
          "lastPaymentDate": incomeLastPayDayDate.text,
          "howOften": howOftenSelectedVal.value,
          "accountAssociated": accountsSelectedItems.value,
        });
        if (response.code == 1) {
          // SnackBars.successSnackBar(content: response.message!);
          await editYourBudgetController.getExpenseList(isLoaderShow: false);
          Navigator.pop(context);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  updateExpense(BuildContext context, String id) async {
    if (addExpenseFormKey.currentState!.validate() && !isLoading.value) {
      // TODO: INCOME ADD
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addIncomeExpenseRepository.updateExpense({
          "userUuid": userInfo["userUuid"].toString(),
          "expenseUuid": id,
          "expenseType": incomeTypeSelectedValue.value,
          "expenseAmount": incomeAmountController.text,
          "lastPaymentDate": incomeLastPayDayDate.text,
          "howOften": howOftenSelectedVal.value,
          "accountAssociated": accountsSelectedItems.value,
        });

        if (response.code == 1) {
          // SnackBars.successSnackBar(content: response.message!);
          await editYourBudgetController.getExpenseList(isLoaderShow: false);
          Navigator.pop(context);

        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> deleteExpense(BuildContext context, String id) async {
    if (!isLoading.value) {
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addIncomeExpenseRepository
            .deleteExpense('${userInfo["userUuid"].toString()}/$id');
        if (response.code == 1) {
          // SnackBars.successSnackBar(content: response.message!);
          await editYourBudgetController.getExpenseList(isLoaderShow: false);
          Navigator.pop(context);

        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  clearIncomeFields() {
    incomeTypeSelectedValue.value = incomeTypeItems.keys.first;
    howOftenSelectedVal.value = howOftenItems.keys.first;
    incomeLastPayDayDate.clear();
    accountsSelectedItems.value = "";
    incomeAmountController.clear();
    incomeNameController.clear();
  }
}
