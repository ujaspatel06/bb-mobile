import 'package:get/get.dart';

class SplitTransactionController extends GetxController {

    final RxMap<String, String> tempItems = {
    'Test A': 'Test A',
    'Test B': 'Test B',
    'Test C': 'Test C',
    'Test D': 'Test D',
    'Test E': 'Test E',
    'Test F': 'Test F',
  }.obs;
  RxString tempSelectedValue = 'Test A'.obs;
}
