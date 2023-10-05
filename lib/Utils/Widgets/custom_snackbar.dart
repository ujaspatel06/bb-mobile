import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class SnackBars {
  ///
  /// Error SnackBar
  ///
  static errorSnackBar(
      {required String content, Color textColor = AppColor.whiteColor}) {
    return Get.rawSnackbar(
        message: content,
        backgroundColor: Colors.red.withOpacity(0.8),
        margin: const EdgeInsets.all(15),
        borderRadius: 10);
  }

  ///
  /// Success SnackBar
  ///
  static successSnackBar(
      {required String content, Color textColor = AppColor.blackColor}) {
    return Get.rawSnackbar(
        message: content,
        backgroundColor: Colors.green.withOpacity(0.8),
        margin: const EdgeInsets.all(15),
        borderRadius: 10);
  }
}
