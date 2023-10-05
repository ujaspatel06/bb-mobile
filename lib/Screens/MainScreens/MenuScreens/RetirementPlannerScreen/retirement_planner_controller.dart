import 'dart:convert';

import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/main.dart';
import 'package:get/get.dart';

class RetirementPlannerController extends GetxController {
  final RxMap<String, String> tempItems = {
    'Test A': 'Test A',
    'Test B': 'Test B',
    'Test C': 'Test C',
    'Test D': 'Test D',
    'Test E': 'Test E',
    'Test F': 'Test F',
  }.obs;
  RxString tempSelectedValue = 'Test A'.obs;

  RxBool isHouseExpensionShow = false.obs;

  final RxList<String> tempItemsList = [
    'Weekly',
    'Monthly',
    'Quarterly',
  ].obs;
  RxString tempSelectedValue2 = 'Weekly'.obs;
  RxBool isAccount = false.obs;
  RxBool isAsset = false.obs;
  RxList<AccountItem> yourAccountData = <AccountItem>[].obs;
  RxList<AccountItem> yourAssetData = <AccountItem>[].obs;
  RxList<AccountItem> accountAssetDataList = <AccountItem>[].obs;
  RxList<AccountItem> accountAssetDataList2 = <AccountItem>[].obs;

  @override
  onInit() {
    getAccountData();
    getAssetData();
    super.onInit();
  }

// get Account data from Local Storage and call on Init
  getAccountData() {
    if (box.read(GetStorageKey.account) == null) {
      String val1 =
          '[{"title":"Everyday account","isSwitched":true},{"title":"Groceries","isSwitched":true},{"title":"Power & Wifi","isSwitched":true},{"title":"Mortgage","isSwitched":false},{"title":"Savings","isSwitched":false},{"title":"Credit Card","isSwitched":false},{"title":"Sharesies","isSwitched":false},{"title":"Kiwisaver","isSwitched":false}]';
      box.write(GetStorageKey.account, val1);
      List list = jsonDecode(val1);
      yourAccountData.value =
          list.map((payment) => AccountItem.fromJson(payment)).toList();

      accountAssetDataList.value = list
          .where((e) => e['isSwitched'] == true)
          .toList()
          .map((payment) => AccountItem.fromJson(payment))
          .toList();
    } else {
      yourAccountData.clear();
      List val2 = jsonDecode(box.read(GetStorageKey.account));

      yourAccountData.value =
          val2.map((payment) => AccountItem.fromJson(payment)).toList();

      accountAssetDataList.value = val2
          .where((e) => e['isSwitched'] == true)
          .toList()
          .map((payment) => AccountItem.fromJson(payment))
          .toList();
    }
  }

// get Asset data from Local Storage and call on Init

  getAssetData() {
    if (box.read(GetStorageKey.asset) == null) {
      String val =
          '[{"title":"House","isSwitched":true},{"title":"Investment property","isSwitched":false},{"title":"Car","isSwitched":false},{"title":"Crypto","isSwitched":false}]';
      box.write(GetStorageKey.account, val);
      List list = jsonDecode(val);
      yourAssetData.value =
          list.map((payment) => AccountItem.fromJson(payment)).toList();

      accountAssetDataList2.value = list
          .where((e) => e['isSwitched'] == true)
          .toList()
          .map((payment) => AccountItem.fromJson(payment))
          .toList();
    } else {
      yourAssetData.clear();
      List val2 = jsonDecode(box.read("asset"));
      yourAssetData.value =
          val2.map((payment) => AccountItem.fromJson(payment)).toList();

      accountAssetDataList2.value = val2
          .where((e) => e['isSwitched'] == true)
          .toList()
          .map((payment) => AccountItem.fromJson(payment))
          .toList();
    }
  }

// Save Account Data in Local Storage and call on Dispose
  saveAccountData() {
    var paymentsAsMap =
        yourAccountData.map((payment) => payment.toJson()).toList();
    String jsonString = jsonEncode(paymentsAsMap);
    box.write(GetStorageKey.account, jsonString);
  }

  // Save Asset Data in Local Storage and call on Dispose
  saveAssetData() {
    var paymentsAsMap =
        yourAssetData.map((payment) => payment.toJson()).toList();
    String jsonString = jsonEncode(paymentsAsMap);

    box.write(GetStorageKey.asset, jsonString);
  }
}

class AccountItem {
  String? title;
  bool? isSwitched;

  AccountItem({this.title, this.isSwitched = false});

  AccountItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isSwitched = json['isSwitched'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['isSwitched'] = isSwitched;
    return data;
  }
}
