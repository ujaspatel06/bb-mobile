import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/AccountDetailScreen/account_detail_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/AddCashAccount/add_cash_account_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/account_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/common_appbar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AccountController accountController = Get.put(AccountController());
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
          "Accounts",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
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
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                "Add a new account",
                                color: AppColor.whiteColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              TextWidget(
                                "Bring everything into one place.",
                                color: AppColor.blueColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                                context,
                                settings:
                                const RouteSettings(name: Routes.addCashAccountScreen),
                                screen:  const AddCashAccountScreen(routesName: Routes.accountScreen),
                                pageTransitionAnimation: PageTransitionAnimation.fade,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                  color: AppColor.whiteColor,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.add,
                                color: AppColor.blackColor,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                TextWidget("Account balances",
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 16.sp),
                SizedBox(
                  height: 1.h,
                ),
                Obx(
                  ()=> ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: accountController.accountList.length,
                      itemBuilder: (context, index) {
                        var accountListValue = accountController.accountList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: InkWell(
                            onTap: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: Routes.accountDetailScreen),
                                screen:  AccountDetailScreen(accounts: accountListValue ,routesName: Routes.accountScreen,),
                                pageTransitionAnimation:
                                    PageTransitionAnimation.fade,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: context.theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadows: [commonBoxshdow(blurRadius: 30)],
                              ),
                              child: Row(
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
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(accountListValue.accountName??"",
                                            fontWeight: FontWeight.w600,
                                            color: context
                                                .theme.textTheme.titleMedium!.color,
                                            fontSize: 13.sp),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        TextWidget("15-8478-383737-05",
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.greyColor,
                                            fontSize: 10.sp),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextWidget("\$ ${accountListValue.value}",
                                      fontWeight: FontWeight.w600,
                                      color: accountListValue.value! < 0?AppColor.redColor:AppColor.greenAssentColor,
                                      fontSize: 12.sp),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: DottedBorder(
                    color: AppColor.greyColor,
                    strokeWidth: 3,
                    borderType: BorderType.RRect,
                    dashPattern: const [10, 5],
                    radius: const Radius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: context.theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [commonBoxshdow(blurRadius: 30)],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 3.w,
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.greenAssentColor,
                            ),
                            child: Center(
                              child: TextWidget("\$",
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget("Got some cash laying around?",
                                    fontWeight: FontWeight.w600,
                                    color: context
                                        .theme.textTheme.titleMedium!.color,
                                    textAlign: TextAlign.start,
                                    fontSize: 13.sp),
                                const SizedBox(
                                  height: 6,
                                ),
                                TextWidget("Add a cash account",
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.greyColor,
                                    fontSize: 11.sp),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
          );
  }
}
