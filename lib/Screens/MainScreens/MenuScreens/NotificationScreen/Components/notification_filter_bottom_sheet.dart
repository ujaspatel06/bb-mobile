import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_controller.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

NotificationController notificationController =
    Get.put(NotificationController());

class NotificationFilterBottomSheet {
  static void showModalSheet(
      BuildContext context, AnimationController controller) {
    showModalBottomSheet(
      transitionAnimationController: controller,
      context: context,
      backgroundColor: context.theme.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      isScrollControlled: true,
      isDismissible: true,
      useRootNavigator: true,
      builder: (builder) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextWidget(
                        "Filter Notifications",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: context.theme.textTheme.titleMedium!.color,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          color: context.theme.textTheme.titleMedium!.color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    "Type",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Wrap(
                      children: [
                        for (var i = 0;
                            i < notificationController.notificationType.length;
                            i++)
                          GestureDetector(
                            onTap: () {
                              notificationController.selectedType.value =
                                  notificationController.notificationType[i];
                            },
                            child: Chip(
                              label: TextWidget(
                                  notificationController.notificationType[i],
                                  color: notificationController
                                              .selectedType.value ==
                                          notificationController
                                              .notificationType[i]
                                      ? AppColor.whiteColor
                                      : context
                                          .theme.textTheme.titleMedium!.color),
                              backgroundColor: notificationController
                                          .selectedType.value ==
                                      notificationController.notificationType[i]
                                  ? SaprateLightDarkColor.greenLightColor
                                  : context.theme.primaryColor,
                              side: BorderSide(
                                  color: notificationController
                                              .selectedType.value ==
                                          notificationController
                                              .notificationType[i]
                                      ? context.theme.primaryColor
                                      : AppColor.greyColor),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                            ).marginSymmetric(horizontal: 5),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
