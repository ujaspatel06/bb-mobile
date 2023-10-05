import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/account_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/account_screen.dart';
import 'package:budget_buddie/Utils/Widgets/common_chip.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/box_shadow.dart';
import '../../../../Utils/constant.dart';

class AccountBalance extends StatefulWidget {
  const AccountBalance({super.key});

  @override
  State<AccountBalance> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  AccountController accountController = Get.put(AccountController());
  DashBoardController dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _shimmerAccountBalance()
        : Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (accountController.accountList.isNotEmpty) ...[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      TextWidget(
                        "Account Balance",
                        fontSize: 16.sp,
                        color: context.theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(),
                      if (!dashBoardController
                          .isWidegetHide("Account balances"))
                        InkWell(
                            onTap: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: Routes.accountScreen),
                                screen: const AccountScreen(),
                                pageTransitionAnimation:
                                    PageTransitionAnimation.fade,
                              );
                            },
                            child: const CommonChip(title: "See all")),
                    ],
                  ).marginOnly(
                      bottom: !dashBoardController.isWidegetHide("Transaction")
                          ? 5
                          : 0),
                ],
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: accountController.accountList.length,
                    itemBuilder: (context, index) {
                      var accountListValue =
                          accountController.accountList[index];
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
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(accountListValue.accountName!,
                                          fontWeight: FontWeight.w600,
                                          color: context.theme.textTheme
                                              .titleMedium!.color,
                                          textAlign: TextAlign.start,
                                          maxLine: 1,
                                          fontSize: 13.sp),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      TextWidget("15-8478-383737-05",
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.start,
                                          maxLine: 1,
                                          color: AppColor.greyColor,
                                          fontSize: 11.sp),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                TextWidget("\$ ${accountListValue.value}",
                                    fontWeight: FontWeight.w600,
                                    color: accountListValue.value! < 0
                                        ? AppColor.redColor
                                        : AppColor.greenAssentColor,
                                    fontSize: 12.sp),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          );
  }

  Widget _shimmerAccountBalance() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
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
                  if (index == 0) ...[
                    Row(
                      children: [
                        Container(
                          height: 24,
                          width: 150,
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Spacer(),
                        CommonChip(title: "title")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                  Container(
                    height: 60,
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
