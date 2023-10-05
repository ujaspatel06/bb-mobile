import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/AddAssetLiabilityScreen/add_asset_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/AddAssetLiabilityScreen/add_liability_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/Components/custom_expension_widget.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/net_worth_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/net_worth_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/common_appbar.dart';

class EditNetWorthScreen extends StatefulWidget {
  const EditNetWorthScreen({super.key});

  @override
  State<EditNetWorthScreen> createState() => _EditNetWorthScreenState();
}

class _EditNetWorthScreenState extends State<EditNetWorthScreen> {
  NetWorthController netWorthController = Get.put(NetWorthController());

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
          "Edit your net worth",
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
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
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
                            onTap: () {
                              PersistentNavBarNavigator
                                  .pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(
                                    name: Routes.netWorthScreen),
                                screen: const NetWorthScreen(),
                                pageTransitionAnimation:
                                    PageTransitionAnimation.fade,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                      "View net worth summary",
                                      color: AppColor.whiteColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    TextWidget(
                                      "Get the full overview.",
                                      color: AppColor.blueAccentColor,
                                      fontSize: 10.5.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(13),
                                  decoration: const BoxDecoration(
                                      color: AppColor.whiteColor,
                                      shape: BoxShape.circle),
                                  child: RotatedBox(
                                      quarterTurns: 3,
                                      child: SvgPicture.asset(
                                          AssetSvgs.upDownIcon)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextWidget("Your Assets",
                      fontWeight: FontWeight.w700,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontSize: 16.sp),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: netWorthController.assetList.length,
                      itemBuilder: (context, index) {
                        return CustomExpansionTile(
                          itemUuid:
                              netWorthController.assetList[index].assetsUuid,
                          lable:
                              netWorthController.assetList[index].assetsName!,
                          value: netWorthController.assetList[index].value!
                              .toString(),
                          image: netWorthController.assetList[index].avatar!,
                          owingAmount: netWorthController
                              .assetList[index].amount!
                              .toString(),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [commonBoxshdow()],
                        color: SaprateLightDarkColor.greenLightColor),
                    child: Row(
                      children: [
                        TextWidget("Total Assets",
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                            fontSize: 14.sp),
                        const Spacer(),
                        TextWidget("\$ ${netWorthController.totalAssetValue}",
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                            fontSize: 14.sp),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings:
                            const RouteSettings(name: Routes.addAssetScreen),
                        screen: const AddAssetScreen(),
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          boxShadow: [commonBoxshdow()],
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                        TextWidget(
                          "Add Assets",
                          fontSize: 12.sp,
                          color: context.theme.textTheme.titleMedium!.color,
                          fontWeight: FontWeight.w500,
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextWidget("Your Liabilities",
                      fontWeight: FontWeight.w700,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontSize: 16.sp),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: netWorthController.liabilityList.length,
                      itemBuilder: (context, index) {
                        return CustomExpansionTile(
                          isLiabilities: true,
                          itemUuid: netWorthController
                              .liabilityList[index].liabilityUuid,
                          lable: netWorthController
                              .liabilityList[index].liabilityName!,
                          value: netWorthController.liabilityList[index].value!
                              .toString(),
                          image:
                              netWorthController.liabilityList[index].avatar!,
                          linkToAssetName: netWorthController.assetsItem[
                              netWorthController.liabilityList[index].assetsId!
                                  .toString()],
                          linkToAsset: netWorthController
                              .liabilityList[index].assetsId!
                              .toString(),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [commonBoxshdow()],
                        color: AppColor.redDarkColor),
                    child: Row(
                      children: [
                        TextWidget("Total Liabilities",
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                            fontSize: 14.sp),
                        const Spacer(),
                        TextWidget(
                            "\$ ${netWorthController.totalLiabilityValue}",
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                            fontSize: 14.sp),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings:
                            const RouteSettings(name: Routes.addLiablityScreen),
                        screen: const AddLiabilityScreen(),
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          boxShadow: [commonBoxshdow()],
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                        TextWidget(
                          "Add liability",
                          fontSize: 12.sp,
                          color: context.theme.textTheme.titleMedium!.color,
                          fontWeight: FontWeight.w500,
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  TextWidget(
                    "Your Net Worth",
                    fontSize: 16.sp,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: SaprateLightDarkColor.greenLightColor,
                        boxShadow: [commonBoxshdow()],
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(children: [
                      TextWidget(
                        "Balance left over",
                        fontSize: 14.sp,
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(),
                      TextWidget(
                        "\$ ${netWorthController.totalAssetValue.value - netWorthController.totalLiabilityValue.value}",
                        fontSize: 14.sp,
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
