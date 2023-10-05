import 'dart:math';

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/GoalsScreen/AddGoalScreen/add_goal_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/GoalsScreen/goals_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/GoalsScreen/goals_screen.dart';
import 'package:budget_buddie/Utils/Utils.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_progreebar.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/common_chip.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  DashBoardController dashBoardController = Get.find();
  GoalsController goalsController = Get.put(GoalsController());

  @override
  Widget build(BuildContext context) {
    return isLoading?_shimmerGoals():Obx(
      () => goalsController.goalsList.isEmpty
          ? const SizedBox()
          : Column(
              children: [
                Row(
                  children: [
                    TextWidget(
                      "Goals",
                      fontSize: 16.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w600,
                    ),
                    const Spacer(),
                    if (!dashBoardController.isWidegetHide("Goals"))
                      InkWell(
                          onTap: () {
                            PersistentNavBarNavigator
                                .pushNewScreenWithRouteSettings(
                              context,
                              settings:
                                  const RouteSettings(name: Routes.goalsScreen),
                              screen: const GoalsScreen(),
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: const CommonChip(title: "See all")),
                  ],
                ).marginOnly(bottom: 10),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: min(2, goalsController.goalsList.length),
                    itemBuilder: (context, index) {
                      var goalItem = goalsController.goalsList[index];
                      Color itemColor = pickColorItemList[goalItem.colour] ??
                          pickColorItemList.values.first;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [commonBoxshdow(blurRadius: 30)],
                                color: itemColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 43,
                                      width: 43,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blueGrey.shade100,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                            AssetIcons.appIcon,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    TextWidget(goalItem.goalName ?? '',
                                        fontWeight: FontWeight.w600,
                                        color: context.theme.primaryColor,
                                        fontSize: 13.sp),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  children: [
                                    TextWidget(
                                      "Balance",
                                      fontSize: 9.sp,
                                      color: context.theme.primaryColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    const Spacer(),
                                    TextWidget(
                                      "50%",
                                      fontSize: 9.sp,
                                      color: context.theme.primaryColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CommonLinerProgressBar(
                                  maxValue: 100,
                                  size: 6,
                                  borderRadius: BorderRadius.circular(50),
                                  progressColor: colorToDarkColor(itemColor),
                                  backgroundColor:
                                      AppColor.whiteColor.withOpacity(0.4),
                                  currentValue: 45,
                                  direction: Axis.horizontal,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    TextWidget(
                                      "\$300 ",
                                      fontSize: 14.sp,
                                      color: context.theme.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    TextWidget(
                                      " of \$699",
                                      fontSize: 10.sp,
                                      color: context.theme.primaryColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    const Spacer(),
                                    TextWidget(
                                      "12th December 2022",
                                      fontSize: 10.sp,
                                      color: context.theme.primaryColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    PersistentNavBarNavigator
                                        .pushNewScreenWithRouteSettings(
                                      context,
                                      settings: const RouteSettings(
                                          name: Routes.goalsDetailScreen),
                                      screen: AddGoalScreen(
                                        goalItem: goalItem,
                                      ),
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.fade,
                                    );
                                  },
                                  child: TextWidget(
                                    "See detail",
                                    color: context.theme.primaryColor,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }),
              ],
            ),
    );
  }

  Widget _shimmerGoals() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Column(
                children: [
                  if(index==0)...[
                    Row(
                      children: [
                        Container(height: 24,width: 120, decoration: ShapeDecoration(
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),),
                        Spacer(),
                        CommonChip(title: "title")
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                  Container(
                    height: 210,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
