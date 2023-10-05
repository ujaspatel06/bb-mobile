import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/GoalsScreen/AddGoalScreen/add_goal_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/GoalsScreen/goals_controller.dart';
import 'package:budget_buddie/Utils/Utils.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_progreebar.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  GoalsController goalsController = Get.put(GoalsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: context.theme.textTheme.titleMedium!.color,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        titleWidget: TextWidget(
          "Goals",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: 75,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: context.theme.colorScheme.primaryContainer,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15)),
                          child: SvgPicture.asset(
                            AssetSvgs.vectorItem,
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(15)),
                          child: SvgPicture.asset(AssetSvgs.vectorItem2)),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                "Add a new goal",
                                color: AppColor.whiteColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              TextWidget(
                                "Keep on track.",
                                color: AppColor.blueColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: Routes.addGoalScreen),
                                screen: const AddGoalScreen(),
                                pageTransitionAnimation:
                                    PageTransitionAnimation.fade,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  color: AppColor.whiteColor,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.add,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: goalsController.goalsList.length,
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
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
