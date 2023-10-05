import 'package:get/get.dart';

class TransactionDetailController extends GetxController {

  RxString transactionDetailSelectItem =
    'Insurance'
  .obs;


  RxList<RxList<String>> transactionDetailList = [
    ["Ami insurance", "Insurance"].obs,
    ["Bleached Cafe", "Health"].obs,
    ["Countdown", "Utilities"].obs,
    ["Uber", "Groceries"].obs,
    ["Mcdonalds", "Shopping"].obs,
    ["Paknsave", "Travel"].obs,
    ["Rebel Sport", "Eating out"].obs,
  ].obs;
}
