import 'package:get/get.dart';

class MerchantDetailsController extends GetxController {
  RxString imageName = ''.obs;
  RxString imagePath = ''.obs;


  RxString merchantDetailSelectItem = 'Insurance'.obs;

  RxList<String> merchantDetailList = [
    "Insurance",
    "Health",
    "Utilities",
    "Groceries",
    "Shopping",
    "Travel",
    "Eating out",
  ].obs;

  RxList dateRangeItem = [
    'This week',
    'This month',
    'This quarter',
    'This year',
  ].obs;



  RxString spendHistorySelectedItem = 'This week'.obs;
}
