// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/EditYourBudgetScreen/edit_your_budget_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/budget_summary_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class BudgetTabBarView extends StatefulWidget {
  const BudgetTabBarView({super.key});

  @override
  State<BudgetTabBarView> createState() => _BudgetTabBarViewState();
}

class _BudgetTabBarViewState extends State<BudgetTabBarView>
 {
  // TabController? tabController;
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   tabController = TabController(length: 3, vsync: this);
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   tabController?.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,

      length: 3,
      child: Scaffold(

        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: customAppBar(
          actions: [
            InkWell(
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  settings:
                      const RouteSettings(name: Routes.editYourBudgetScreen),
                  screen: const EditYourBudgetScreen(),
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
              child: SvgPicture.asset(
                AssetSvgs.editIcon,
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
            "Budget summary",
            color: context.theme.textTheme.titleMedium!.color,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.theme.colorScheme.onPrimary,
                  boxShadow: [commonBoxshdow(blurRadius: 30)],
                ),
                child: TabBar(
                  // controller: tabController,
                  indicator: BoxDecoration(
                    color: context.theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        box.read(GetStorageKey.themeMode) ?? false
                            ? AssetPngs.tabDarkContainer
                            : AssetPngs.tabLightContainer,
                      ),
                    ),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor:
                      context.theme.textTheme.titleMedium!.color,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 11.sp),
                  tabs: const [
                    Tab(
                      text: 'This week',
                    ),
                    Tab(
                      text: 'This month',
                    ),
                    Tab(
                      text: 'This quarter',
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(children: [
                  BudgetSummaryScreen(),
                  NotificationScreen(),
                  BudgetSummaryScreen(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
