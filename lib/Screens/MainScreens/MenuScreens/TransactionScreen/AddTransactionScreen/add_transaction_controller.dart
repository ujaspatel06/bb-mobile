import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTransactionController extends GetxController {
  RxString imageName = ''.obs;
  RxString imagePath = ''.obs;


  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  // TextEditingController imageController = TextEditingController();
  final GlobalKey<FormState> addTransactionKey = GlobalKey<FormState>();

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
