import 'package:get/get.dart';

class TransactionController extends GetxController {
  final RxMap<String, String> tempItems = {
    'Test A': 'Test A',
    'Test B': 'Test B',
    'Test C': 'Test C',
    'Test D': 'Test D',
    'Test E': 'Test E',
    'Test F': 'Test F',
  }.obs;

  RxList spendRangeType = [
    '\$0-\$10',
    '\$10-\$50',
    '\$50-\$100',
    '\$100-\$300',
    '\$300-\$600',
    '\$600+',
  ].obs;
  RxList categoriesType = [
    'Insurance',
    'Food',
    'Health',
    'Clothes',
    'Travel',
    'Categorised',
    'Un-categorised'
  ].obs;
  RxList dateRangeType = [
    'This week',
    'This month',
    'This quarter',
    'This year',
    'Last week',
    'Last month',
    'Last quarter'
        'Last year'
  ].obs;

  RxList transactionCategoryList = [
    'Insurance',
    'Health',
    'Utilities',
    'Groceries',
    'Shopping',
    'Travel',
    'Eating Out',
  ].obs;

  RxList<RxList<String>> transactionList = <RxList<String>>[].obs;

  RxList<RxList<String>> tempTransactionList = [
    ["Ami insurance", "Insurance"].obs,
    ["Bleached Cafe", "Health"].obs,
    ["Countdown", "Utilities"].obs,
    ["Uber", "Groceries"].obs,
    ["Mcdonalds", "Shopping"].obs,
    ["Paknsave", "Travel"].obs,
    ["Rebel Sport", "Eating out"].obs,
  ].obs;

  RxList<RxList<String>> yesterdayTransactionList = [
    ["Ami insurance", "Insurance"].obs,
    ["Bleached Cafe", "Health"].obs,
    ["Countdown", "Utilities"].obs,
    ["Uber", "Groceries"].obs,
    ["Mcdonalds", "Shopping"].obs,
    ["Paknsave", "Travel"].obs,
    ["Rebel Sport", "Eating out"].obs,
  ].obs;

  Future searchdata(String query) async {
    transactionList.value = tempTransactionList;
    if (query.isNotEmpty) {
      List<RxList<String>> searchList = [];
      for (var search in tempTransactionList) {
        if (search.first.toLowerCase().contains(query.toLowerCase())) {
          searchList.add(search);
        }
      }

      transactionList.value = searchList;
    }
  }

  RxString spendRangeSelected = ''.obs;
  RxString categoriesSelected = ''.obs;
  RxString dateRangeSelected = ''.obs;

  RxBool isShowSearchField = false.obs;

  RxString tempSelectedValue = 'Test A'.obs;

  @override
  void onInit() {
    transactionList.value = tempTransactionList;

    super.onInit();
  }
}
