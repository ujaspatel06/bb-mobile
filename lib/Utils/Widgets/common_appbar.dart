// Custom Appbar

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/ProfileScreen/profile_screen.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:sizer/sizer.dart';

customAppBar({
  String? title,
  List<Widget>? actions,
  bool? isProfilescreen = false,
  Color? bgColor,
  Widget? titleWidget,
  Function? onBtnPress,
}) {
  return AppBar(
    backgroundColor: bgColor ?? Colors.transparent,
    leadingWidth: 18.w,
    leading: Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            if (onBtnPress != null) {
              onBtnPress();
            }
          },
          child: InkWell(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                context,
                settings: const RouteSettings(name: Routes.profileScreen),
                screen: const ProfileScreen(),
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
              // Get.toNamed(Routes.profileScreen);
            },
            child: isProfilescreen == true
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 26,
                      color: context.theme.textTheme.titleMedium!.color,
                    ))
                : Align(
                    child: Container(
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: context.theme.canvasColor,
                        borderRadius: BorderRadius.circular(100),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    ),

    title: Builder(builder: (context) {
      return titleWidget ??
          TextWidget(
            title ?? "",
            color: context.theme.textTheme.titleMedium!.color,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          );
    }),
    // titleWidget ??
    // SvgPicture.asset(
    //   Assets.svgsAppIcon,
    //   fit: BoxFit.fitHeight,
    //   width: 55,
    // ),
    actions: actions ?? [],
    elevation: 0,

    // flexibleSpace: Container(
    //   decoration: const BoxDecoration(
    //     gradient: LinearGradient(
    //       begin: Alignment.centerLeft,
    //       end: Alignment.centerRight,
    //       colors: <Color>[
    //         AppColor.topLightBlueColor,
    //         AppColor.bottomPurpleColor,
    //       ],
    //     ),
    //   ),
    // ),
  );
}
