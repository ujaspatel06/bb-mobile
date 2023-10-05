import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/generated/assets.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      //   if (GetStorage().read(AppPreferencesHelper.USER_INFO) != null) {
      //     Get.offAllNamed(Routes.mainScreen);
      //   } else {
      if (box.read(GetStorageKey.isPinLogin) ?? false) {
        Get.offAllNamed(Routes.pinLoginScreen);
      } else {
        Get.offAllNamed(Routes.passwordLoginScreen);
      }
      //   }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        width: 100.w,
        height: 100.h,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(Assets.svgsSplashUpperBg)),
            Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset(Assets.svgsSplashBelowBg)),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetIcons.appIcon,
                    height: 70,
                    width: 70,
                  ),
                  TextWidget(
                    'BudgetBuddie',
                    color: AppColor.blackColor,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
