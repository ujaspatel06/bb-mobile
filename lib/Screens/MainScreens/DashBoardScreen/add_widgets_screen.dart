// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'dashboard_controller.dart';

class AddWidgetScreen extends StatefulWidget {
  const AddWidgetScreen({super.key});

  @override
  State<AddWidgetScreen> createState() => _AddWidgetScreenState();
}

class _AddWidgetScreenState extends State<AddWidgetScreen> {
  DashBoardController dashBoardController = Get.put(DashBoardController());

  @override
  void dispose() {
    dashBoardController.onDisposeUpdateList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          InkWell(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              AssetSvgs.closeIcon,
              color: context.theme.textTheme.titleMedium!.color,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Get.toNamed(Routes.notificationScreen);
              },
              child: const CommonNotificationIcon()),
          const SizedBox(
            width: 14,
          ),
        ],
        titleWidget: TextWidget(
          "Add widgets",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20.0),
            itemBuilder: (context, index) {
              return Obx(() => Stack(
                    alignment: Alignment.topRight,
                    children: [
                      dashBoardController.hideWidgetsList[index].values.first,
                      GestureDetector(
                        onTap: () {
                          if (!dashBoardController.showWidgetsList.contains(
                              dashBoardController.hideWidgetsList[index])) {
                            dashBoardController.showWidgetsList.add(
                                dashBoardController.hideWidgetsList[index]);
                            dashBoardController.hideWidgetsList.remove(
                                dashBoardController.hideWidgetsList[index]);
                          }
                        },
                        child: SvgPicture.asset(
                          AssetSvgs.addIcon,
                          height: 22,
                          color: context.theme.textTheme.titleMedium!.color,
                        ),
                      ),
                    ],
                  ));
            },
            itemCount: dashBoardController.hideWidgetsList.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 20,
              );
            },
          ),
        ),
      ),
    );
  }
}
