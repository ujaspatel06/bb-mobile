// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/Components/filter_bottom_sheet.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/Components/income_expenses.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/Components/total_balance.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/main_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'add_widgets_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashBoardController dashBoardController = Get.put(DashBoardController());

  MainController mainController = Get.find();

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
              FilerBottomSheet.showModalSheet(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 7, left: 7),
              child: SvgPicture.asset(
                AssetSvgs.filterIcon,
                color: context.theme.textTheme.titleMedium!.color,
              ),
            ),
          ),
          InkWell(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                context,
                settings: const RouteSettings(name: Routes.addWidgetScreen),
                screen: const AddWidgetScreen(),
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 7, left: 7),
              child: SvgPicture.asset(
                AssetSvgs.addIcon,
                color: context.theme.textTheme.titleMedium!.color,
              ),
            ),
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
                ).then((value) =>
                    mainController.pageIndex.value = NestedKeys.dashBoardId);
                mainController.pageIndex.value = NestedKeys.menuId;
              },
              child: const CommonNotificationIcon()),
          const SizedBox(
            width: 7,
          ),
        ],
        titleWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              "Good Morning",
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: context.theme.textTheme.titleMedium!.color,
            ),
            const SizedBox(
              height: 3,
            ),
            TextWidget(
              "Tim",
              color: context.theme.textTheme.titleMedium!.color,
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const TotalBalance(),

                const IncomeExpenses(),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return dashBoardController
                        .showWidgetsList[index].values.first;
                  },
                  itemCount: dashBoardController.showWidgetsList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      // SingleChildScrollView(
      //   physics: const BouncingScrollPhysics(),
      //   child: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child:
      //     Column(
      //       children: [
      //         const TotalBalance(),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         const IncomeExpenses(),
      //         SizedBox(
      //           height: 2.h,
      //         ),
      //         const Top5Expenses(),
      //         SizedBox(
      //           height: 1.h,
      //         ),
      //         const SpendvsBudget(),
      //         SizedBox(
      //           height: 3.h,
      //         ),
      //         const Transaction(),
      //         SizedBox(
      //           height: 2.h,
      //         ),
      //         const IncomevsExpensesGraph(),
      //         SizedBox(
      //           height: 3.h,
      //         ),
      //         const Goals(),
      //         SizedBox(
      //           height: 3.h,
      //         ),
      //         const Merchants(),
      //         SizedBox(
      //           height: 3.h,
      //         ),
      //         const CashFlowLineChart(),
      //         SizedBox(
      //           height: 3.h,
      //         ),
      //         const AccountBalance(),
      //         SizedBox(
      //           height: 3.h,
      //         ),
      //         const IncomeBreakdown(),
      //         SizedBox(
      //           height: 3.h,
      //         ),
      //         const ExpensesBreakdown(),
      //         SizedBox(
      //           height: 3.h,
      //         ),
      //         const NetWorthProgress(),
      //         SizedBox(
      //           height: 2.h,
      //         ),
      //         const Top5Merchants(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
