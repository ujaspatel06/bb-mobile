// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppColor {
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);
  static const textPrimaryColor = Color(0xFF2B2B2B);
  static const textSecondaryColor = Color(0xFF7E838E);
  static const greyColor = Colors.grey;
  static const darkBlueColor = Color(0xFF014479);

  static const greenAssentColor = Color(0xFF4BBE71);
  static const buttonGreenColor = Color(0xFF489987);

  static const purpleColor = Color(0xFF240E50);

  static const blueColor = Color(0xFF2573EF);
  static const blueAccentColor = Color(0xFF9ccaf6);

//
  static const primaryLightColor = Color(0xFFFCFCFC);
  static const primaryDarkColor = Color(0xFF161616);

  static const hintLightColor = Color(0xFF001B49);
  static const hintdarkColor = Color(0xFFB6D1FF);

  static const blueaccentLightColor = Color(0xFF5CA9D3);

  // static const buttonLightColor = Color(0xFF014479);
  static const buttonDarkColor = Color(0xFFD8E8ED);

  static const canvasLightColor = Color(0xFFEFEDED);
  static const canvasDarkColor = Color(0xFF1F1C1C);

  static const cardDarkColor = Color(0xFF1F1C1C);
  static const cardLightColor = Color(0xFFEFEDED);

  static const primaryContainerLightColor = Color(0xFF001B49);
  static const primaryContainerdarktColor = Color(0xFF000000);
  static const orangeAccentColor = Color(0xFFE0533D);
  static const redColor = Colors.red;

  static const redDarkColor = Color(0xFFD04F4F);

  static const amberDarkColor = Color(0xFFF68402);
  static const amberLightColor = Color(0xFFFFB26B);
  static const greenDarkColor = Color(0xFF2E7D32);
  static const calendarDarkGreenColor = Color(0xFF005049);

  static const blueLightColor = Color(0xFF377CC8);
  static const yellowLightColor = Color(0xFFEED868);
  static const pinkLightColor = Color(0xFFE78C9D);

  static const brownDarkColor = Color(0xFFB51800);
  static const pinkDarkColor = Color(0xFFD9556E);

  static const fullLightGreenColor = Color(0xFF76FF7B);
  static const purpleLightColor = Color(0xFF8D83FF);

  static const darkCyanColor = Color(0xFF128dba);

  // Bottom pick Color

  static const pickRedColor = Color(0xFFE0533D);
  static const pickLightGreenColor = Color(0xFF3DE0B8);
  static const pickBlueColor = Color(0xFF3D6AE0);
  static const pickGreenColor = Color(0xFF3DE06A);
  static const pickYellowColor = Color(0xFFDCE03D);
  static const pickLightBlueColor = Color(0xFF3DAFE0);
  static const pickOrangeColor = Color(0xFFE09E3D);
  static const pickPinkColor = Color(0xFFDC3DE0);
  static const pickPurpleColor = Color(0xFF983DE0);
}

// For Light Dark Color Theme
class SaprateLightDarkColor {
  //Light

  static const pinkLightColor = Color(0xFFFF5959);
  static const greenLightColor = Color(0xFF469B88);

  //Dark

  static const redColor = Color(0xFFFF2323);
  static const cyanColor = Color(0xFF4EFFD9);
}

///
/// This class is used for difine the static keys for local storage, you can access the value with this key
///
class NestedKeys {
  static const int dashBoardId = 0;
  static const int budgetId = 1;
  static const int moreUserId = 2;
  static const int menuId = 3;
}

///  DARK MODE SHOW (TRUE/FALSE)
bool isDarkMode = true;
bool isLightMode = true;
bool isLoading= false;

// Get Storage Key

///
class GetStorageKey {
  static const themeMode = 'isThemeMode';
  static const account = 'account';
  static const asset = 'asset';
  static const isFaceId = 'faceId';
  static const isPinLogin = 'pinLogin';
  static const editsWidgets = 'editsWidgets';
  static const loginPin = 'loginPin';
  static const isBiometricValid = 'isBiometricEnable';
  static const USER_INFO = "userInfo";
}

class ErrorMsg {
  static const String PLEASE_CHECK_BOX =
      "Please accept the terms and conditions";
  static const String PLEASE_EMAIL_INPUT = "Please enter email";
  static const String PLEASE_PASSWORD_INPUT = "Please enter password";
  static const String PLEASE_NAME_INPUT = "Please enter name";
  static const String PLEASE_FIRST_NAME_INPUT = "Please enter first name";
  static const String PLEASE_LAST_NAME_INPUT = "Please enter last name";
  static const String CONFIRM_PASS_NOT_MATCH =
      "The confirm password does not match.";

  static const String INCOME_NAME = "Please enter name";
  static const String INCOME_AMOUNT = "Please enter amount";

  static const String SELECT_DATE = "Please select date";
  static const String ENTER_NAME = "Please enter name";
  static const String ENTER_EMAIL = "Please enter email";
  static const String ENTER_PHONE_NUMBER = "Please enter phone number";
  static const String ENTER_VALUE = "Please enter value";
  static const String ENTER_IMAGE = "Please select image";
  static const String ENTER_AMOUNT = "Please enter amount";
  static const String ENTER_REFERENCE = "Please enter reference";
  static const String ENTER_COLOR = "Please choose colour";
  static const String ENTER_ACCOUNT = "Please choose account";
  static const String ENTER_ICON = "Please upload icon";
  static const String ENTER_CONTRIBUTION = "Please enter contribution";
  static const String REQUIRED = "Required";
}

final Map<String, Color> pickColorItemList = {
  'Red': AppColor.pickRedColor,
  'Light green': AppColor.pickLightGreenColor,
  'Blue': AppColor.pickBlueColor,
  'Green': AppColor.pickGreenColor,
  'Yellow': AppColor.pickYellowColor,
  'Light blue': AppColor.pickLightBlueColor,
  'Orange': AppColor.pickOrangeColor,
  'Pink': AppColor.pickPinkColor,
  'Purple': AppColor.pickPurpleColor,
};

// App Version Info
// String appName = '';
// String packageName = '';
// String version = '';
// String buildNumber = '';

// Strings

// String passwordNotMatch = "This password seems don’t match! Try again.";
// String passwordCorrect = "Please Enter Correct Password.";
// String passwordStrong = "Please Enter Strong Password.";

// Place Holder Image

// String placeHolderImg =
//     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNg9FjmQSz3-2pDVFp4EM3NTQn91ApoG3o_tPrcE11S2d2XPoFKTDvPydg4-bK5224i6k&usqp=CAU';
