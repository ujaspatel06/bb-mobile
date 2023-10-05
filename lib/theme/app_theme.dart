// ignore_for_file: prefer_const_constructors

import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final dark = ThemeData.dark().copyWith(
    
    scaffoldBackgroundColor: AppColor.primaryDarkColor,
    primaryColor: AppColor.blackColor,
    textTheme:  TextTheme(
      
      // displayLarge: TextStyle(color: Colors.white),
      // bodySmall: TextStyle(color: AppColor.whiteColor),
      titleMedium: GoogleFonts.inter(color: Colors.white),
      titleSmall: GoogleFonts.inter(color: Colors.white),
      titleLarge: GoogleFonts.inter(color: Colors.white),
      labelLarge: GoogleFonts.inter(color: AppColor.cardDarkColor),
    ),
    //  buttonTheme: ButtonThemeData(
    //   buttonColor: AppColor.buttonDarkColor
    // ),
    colorScheme: ColorScheme.dark(
        primaryContainer: AppColor.primaryContainerdarktColor,
        onPrimary: Color(0xFF3A3A3A)),

    cardColor: AppColor.buttonDarkColor,
    hintColor: AppColor.hintdarkColor,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.blackColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        )),
    // hintColor: const Color(0xFFB7CBFC),
    // disabledColor: const Color(0xFF373755),
    // cardColor: const Color(0xFF262638),
    // unselectedWidgetColor: const Color(0xFFB7CBFC),
    canvasColor: AppColor.canvasDarkColor,
    // bottomNavigationBarTheme:
    //     const BottomNavigationBarThemeData(backgroundColor: Color(0xFF262638)),
    // bottomSheetTheme: const BottomSheetThemeData(
    //   backgroundColor: Color(0xFF404550),
    // ),
    // dividerTheme: const DividerThemeData(color: Color(0xFF404550)),
    // appBarTheme: const AppBarTheme(
    //     systemOverlayStyle:
    //         SystemUiOverlayStyle(statusBarColor: AppColor.whiteColor)),
    // colorScheme: const ColorScheme(background: Colors.black)
  );

  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColor.primaryLightColor,
    primaryColor: AppColor.whiteColor,
    textTheme:  TextTheme(
      // displayLarge: TextStyle(color: Colors.black),
      // bodySmall: TextStyle(color: AppColor.textPrimaryColor),

      titleMedium: GoogleFonts.inter(color: Colors.black,),
      titleSmall: GoogleFonts.inter(color: Colors.black),
      titleLarge: GoogleFonts.inter(color: Colors.black),
      labelLarge: GoogleFonts.inter(color: AppColor.cardLightColor),
    ),
    // buttonTheme: ButtonThemeData(
    //   buttonColor: AppColor.buttonLightColor
    // ),
    colorScheme: ColorScheme.light(
        primaryContainer: AppColor.primaryContainerLightColor,
        onPrimary: AppColor.whiteColor),
    cardColor: AppColor.darkBlueColor,
    hintColor: AppColor.hintLightColor,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.whiteColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        )),
    // disabledColor: const Color(0xFF7E838E),
    canvasColor: AppColor.canvasLightColor,
    // dividerTheme: const DividerThemeData(color: Color(0xFFAFE0FF)),
    // bottomNavigationBarTheme:
    //     const BottomNavigationBarThemeData(backgroundColor: Color(0xFFEBF8FF)),
    // unselectedWidgetColor: const Color(0xFFE6EDFA),

    //  colorScheme:  ColorScheme(background: Colors.white,brightness: Brightness.light)
  );
}
