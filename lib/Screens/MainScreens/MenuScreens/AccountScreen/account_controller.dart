import 'package:budget_buddie/Data/Models/cash_account_model.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/account_repository.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Accounts> accountList = <Accounts>[].obs;
  AccountRepository accountRepository = AccountRepository();
  RxMap<String, String> accountsItems = <String, String>{}.obs;

  @override
  void onInit() {
    getAccountList();
    super.onInit();
  }

  Future getAccountList({bool isLoaderShow = true}) async {
    try {
      isLoading.value = true;
      var token = GetStorage().read(GetStorageKey.USER_INFO) ?? '{}' as Map;
      accountList.clear();
      accountsItems.clear();
      var response = await accountRepository.getCashAccount(
          token["userUuid"].toString(),
          isLoaderShow: isLoaderShow);

      if (response.accounts != null) {
        List<Accounts> accounts = <Accounts>[];
        accounts.addAll(response.accounts!);
        accountList.addAll(accounts.reversed);

        for (var i in accountList) {
          accountsItems[i.accountUuid!] = i.accountName ?? '';
        }
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    } finally {
      isLoading.value = false;
    }
  }
}
