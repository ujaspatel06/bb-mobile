import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/account_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/CashflowScreen/Components/cashflow_tab_bar.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/edit_net_worth_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/ProfileScreen/profile_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/RetirementPlannerScreen/retirement_planner_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/transaction_screen.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import 'ConnectYourAccountScreen/connect_your_account_screen.dart';
import 'GoalsScreen/goals_screen.dart';
import 'commonContainer.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
          "Menu",
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
            child: Column(children: [
              Container(
                height: 66,
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: context.theme.colorScheme.primaryContainer,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15)),
                        child: SvgPicture.asset(
                          AssetSvgs.frameIcon,
                          height: 50,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
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
                          width: 3.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              "Good Morning",
                              color: AppColor.whiteColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            TextWidget(
                              "Tim | test@gmail.com",
                              color: AppColor.whiteColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings:
                        const RouteSettings(name: Routes.editNetWorthScreen),
                    screen: const EditNetWorthScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                child: CommonContainer.commonMenuScreenContainer(
                    context, AssetPngs.netWorth, "Net Worth"),
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(name: Routes.goalsScreen),
                    screen: const GoalsScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                child: CommonContainer.commonMenuScreenContainer(
                    context, AssetPngs.goals, "Goals"),
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(
                        name: Routes.retirementPlannerScreen),
                    screen: const RetirementPlannerScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                child: CommonContainer.commonMenuScreenContainer(context,
                    AssetPngs.retirementPlanning, "Retirement Planner"),
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(name: Routes.cashflowTabBar),
                    screen: const CashflowTabBarView(),
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                child: CommonContainer.commonMenuScreenContainer(
                    context, AssetPngs.cashflow, "Cashflow"),
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings:
                        const RouteSettings(name: Routes.transactionScreen),
                    screen: const TransactionScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                child: CommonContainer.commonMenuScreenContainer(
                    context, AssetPngs.transactions, "Transactions"),
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(name: Routes.accountScreen),
                    screen: const AccountScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                child: CommonContainer.commonMenuScreenContainer(
                    context, AssetPngs.accounts, "Accounts"),
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(
                        name: Routes.connectYourAccountScreen),
                    screen: const ConnectYourAccountScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                child: CommonContainer.commonMenuScreenContainer(context,
                    AssetPngs.connectYourAccount, "Connect your accounts"),
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(name: Routes.profileScreen),
                    screen: const ProfileScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
                child: CommonContainer.commonMenuScreenContainer(
                    context, AssetPngs.settings, "Settings"),
              ),
              SizedBox(
                height: 1.h,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
