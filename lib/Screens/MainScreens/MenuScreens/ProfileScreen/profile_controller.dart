import 'package:budget_buddie/theme/theme_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nextPaymentDateController = TextEditingController();
  TextEditingController nextPaymentAmountController = TextEditingController();
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  RxBool isDarkSwitch = true.obs;
  RxBool isFaceID = false.obs;
  RxBool isPinLogin = false.obs;
  RxBool isBudget = false.obs;
  RxBool isGoal = false.obs;
  RxBool isMonthly = false.obs;
  RxBool isMerchants = false.obs;

  RxString planGroupValue = "".obs;

  RxString imageName = ''.obs;
  RxString imagePath = ''.obs;

  RxString loginPin = ''.obs;

  @override
  void onInit() async {
    final box = GetStorage();
    const key = 'isThemeMode';
    isDarkSwitch.value = box.read(key) ?? false;
    super.onInit();
  }

  onChangeTheme(bool value) {
    isDarkSwitch.value = value;
    ThemeServices().switchTheme();
    HapticFeedback.mediumImpact();
    update();
  }

  RxList profileType = [
    'test@gmail.com',
    'test1@gmail.com',
    'test2@gmail.com',
  ].obs;

  RxString selectedType = 'test@gmail.com'.obs;
}
