// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/Components/notification_filter_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/text_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  AnimationController? controller;

  @override
  initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);

    controller!.duration = const Duration(seconds: 1);

    controller!.reverseDuration = const Duration(seconds: 1);
    controller!.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        titleWidget: TextWidget(
          "Notifications",
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TextWidget(
                      "Notifications",
                      fontSize: 16.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        NotificationFilterBottomSheet.showModalSheet(
                            context, controller!);
                      },
                      child: SvgPicture.asset(
                        AssetSvgs.notificationFilter,
                        color: context.theme.textTheme.titleMedium!.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: context.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [commonBoxshdow(blurRadius: 30)],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  height: 43,
                                  width: 43,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: notificationController
                                        .todayNotification[index][1],
                                  ),
                                  child: SvgPicture.asset(
                                    notificationController
                                        .todayNotification[index].first,
                                    color: context.theme.primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                          "${notificationController.todayNotification[index].last}",
                                          textAlign: TextAlign.start,
                                          maxLine: 1,
                                          fontWeight: FontWeight.w600,
                                          color: context.theme.textTheme
                                              .titleMedium!.color,
                                          fontSize: 13.sp),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      TextWidget(
                                          "You achieved your savings goal!",
                                          textAlign: TextAlign.start,
                                          maxLine: 1,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.greyColor,
                                          fontSize: 10.sp),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                TextWidget("See more",
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.greenAssentColor,
                                    fontSize: 12.sp),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 12,
                ),
                TextWidget(
                  "Yesterday",
                  fontSize: 14.sp,
                  color: context.theme.textTheme.titleMedium!.color,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 1.h,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: context.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [commonBoxshdow(blurRadius: 30)],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  height: 43,
                                  width: 43,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: notificationController
                                        .yesterdayNotification[index][1],
                                  ),
                                  child: SvgPicture.asset(
                                    notificationController
                                        .yesterdayNotification[index].first,
                                    color: context.theme.primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                          "${notificationController.yesterdayNotification[index].last}",
                                          textAlign: TextAlign.start,
                                          maxLine: 1,
                                          fontWeight: FontWeight.w600,
                                          color: context.theme.textTheme
                                              .titleMedium!.color,
                                          fontSize: 13.sp),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      TextWidget("Spent over weekly budget",
                                          textAlign: TextAlign.start,
                                          maxLine: 1,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.greyColor,
                                          fontSize: 10.sp),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                TextWidget("See more",
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.greenAssentColor,
                                    fontSize: 12.sp),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
