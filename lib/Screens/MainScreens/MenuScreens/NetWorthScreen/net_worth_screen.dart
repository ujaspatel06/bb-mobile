// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/Components/net_worth_progress.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/net_worth_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/custom_rotation_icon.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/common_appbar.dart';

class NetWorthScreen extends StatefulWidget {
  const NetWorthScreen({super.key});

  @override
  State<NetWorthScreen> createState() => _NetWorthScreenState();
}

class _NetWorthScreenState extends State<NetWorthScreen> {
  NetWorthController netWorthController = Get.put(NetWorthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.close,
          //     color: context.theme.textTheme.titleMedium!.color,
          //   ),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // const SizedBox(
          //   width: 2,
          // ),
          InkWell(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              Navigator.pop(context);
              // PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
              //   context,
              //   settings: const RouteSettings(name: Routes.editNetWorthScreen),
              //   screen: const EditNetWorthScreen(),
              //   pageTransitionAnimation: PageTransitionAnimation.fade,
              // );
            },
            child: SvgPicture.asset(
              AssetSvgs.editIcon,
              color: context.theme.textTheme.titleMedium!.color,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  settings:
                      const RouteSettings(name: Routes.notificationScreen),
                  screen: const NotificationScreen(),
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
              child: const CommonNotificationIcon()),
          const SizedBox(
            width: 14,
          ),
        ],
        titleWidget: TextWidget(
          "Net worth summary",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Column(
                    children: [
                      Container(
                        height: 145,
                        // height: 18.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: context.theme.colorScheme.primaryContainer,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15)),
                                  child: SvgPicture.asset(
                                    AssetSvgs.frameSmallIcon,
                                  )),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(15)),
                                  child: SvgPicture.asset(AssetSvgs.frameIcon)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    "Current Net Worth",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.whiteColor,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  TextWidget(
                                    "\$350,000",
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.whiteColor,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        "Assets:",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.whiteColor,
                                      ),
                                      TextWidget(
                                        "\$550,000",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.greenAssentColor,
                                      ),
                                      TextWidget(
                                        "| Liabilities:",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.whiteColor,
                                      ),
                                      TextWidget(
                                        "\$200,000",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.redColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextWidget(
                                      "Full Breakdown",
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.whiteColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: ShapeDecoration(
                                          color: AppColor.whiteColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          shadows: [
                                            commonBoxshdow(blurRadius: 5)
                                          ]),
                                      child: RotatingIconButton(
                                          onTap: (val) {
                                            netWorthController
                                                .isBalanceDetail.value = val;
                                          },
                                          isShow: netWorthController
                                              .isBalanceDetail.value,
                                          borderRadius: 100.0,
                                          rotateType: RotateType.semi,
                                          clockwise: false,
                                          background: AppColor.whiteColor,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 10),
                                            child: SvgPicture.asset(
                                              AssetSvgs.upDownIcon,
                                              color: AppColor.blackColor,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      if (!netWorthController.isBalanceDetail.value)
                        const SizedBox(
                          height: 10,
                        ),
                      if (netWorthController.isBalanceDetail.value) ...[
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget("Your Assets",
                              fontWeight: FontWeight.w600,
                              color: context.theme.textTheme.titleMedium!.color,
                              fontSize: 15.sp),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AnimationLimiter(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 300),
                                  child: FadeInAnimation(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7),
                                      child: Container(
                                        decoration: ShapeDecoration(
                                          color: context.theme.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          shadows: [
                                            commonBoxshdow(blurRadius: 30)
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 43,
                                                width: 43,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      Colors.blueGrey.shade100,
                                                  image: const DecorationImage(
                                                    image: AssetImage(
                                                      AssetIcons.appIcon,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              Expanded(
                                                child: TextWidget("Credit Card",
                                                    fontWeight: FontWeight.w600,
                                                    textAlign: TextAlign.start,
                                                    maxLine: 1,
                                                    color: context
                                                        .theme
                                                        .textTheme
                                                        .titleMedium!
                                                        .color,
                                                    fontSize: 13.sp),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              TextWidget("\$400,00",
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColor.greenAssentColor,
                                                  fontSize: 13.sp),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [commonBoxshdow()],
                              color: SaprateLightDarkColor.greenLightColor),
                          child: Row(
                            children: [
                              TextWidget("Total Assets",
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor,
                                  fontSize: 14.sp),
                              const Spacer(),
                              TextWidget("\$10,000",
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor,
                                  fontSize: 14.sp),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget("Your Liabilities",
                              fontWeight: FontWeight.w600,
                              color: context.theme.textTheme.titleMedium!.color,
                              fontSize: 15.sp),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AnimationLimiter(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 300),
                                  child: FadeInAnimation(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7),
                                      child: Container(
                                        decoration: ShapeDecoration(
                                          color: context.theme.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          shadows: [
                                            commonBoxshdow(blurRadius: 30)
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 43,
                                                width: 43,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      Colors.blueGrey.shade100,
                                                  image: const DecorationImage(
                                                    image: AssetImage(
                                                      AssetIcons.appIcon,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              Expanded(
                                                child: TextWidget("Credit Card",
                                                    fontWeight: FontWeight.w600,
                                                    textAlign: TextAlign.start,
                                                    maxLine: 1,
                                                    color: context
                                                        .theme
                                                        .textTheme
                                                        .titleMedium!
                                                        .color,
                                                    fontSize: 13.sp),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              TextWidget("\$400,00",
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      AppColor.greenAssentColor,
                                                  fontSize: 13.sp),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [commonBoxshdow()],
                              color: AppColor.redDarkColor),
                          child: Row(
                            children: [
                              TextWidget("Total Liabilities",
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor,
                                  fontSize: 14.sp),
                              const Spacer(),
                              TextWidget("\$10,000",
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor,
                                  fontSize: 14.sp),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(
                        height: 20,
                      ),
                      const NetWorthProgress()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
