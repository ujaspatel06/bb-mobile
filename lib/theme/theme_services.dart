import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeServices {
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  bool _loadThemeFromBox() => box.read(GetStorageKey.themeMode) ?? false;
  _saveThemeToBox(bool isDarkMode) =>
      box.write(GetStorageKey.themeMode, isDarkMode);
  void switchTheme() {
    // if (_loadThemeFromBox()) {
    //   SystemChrome.setSystemUIOverlayStyle(
    //       const SystemUiOverlayStyle(statusBarBrightness: Brightness.light,statusBarIconBrightness: Brightness.light));
    // } else {
    //   SystemChrome.setSystemUIOverlayStyle(
    //       const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark,statusBarIconBrightness: Brightness.dark));
    // }
    // Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
