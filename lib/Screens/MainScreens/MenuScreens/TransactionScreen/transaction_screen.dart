// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/AddTransactionScreen/add_transaction_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/Components/common_account_detail_container.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/Components/transaction_filter_bottom_sheet.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/TransactionDetailScreen/transaction_detail_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/transaction_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_avatar_chip.dart';
import 'package:budget_buddie/Utils/Widgets/common_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with TickerProviderStateMixin {
  TransactionController transactionController =
      Get.put(TransactionController());
  AnimationController? controller;

  @override
  initState() {
    super.initState();

    controller = BottomSheet.createAnimationController(this);

    controller!.duration = const Duration(seconds: 1);

    controller!.reverseDuration = const Duration(seconds: 1);
    controller!.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

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
          SizedBox(
            width: 4.w,
          ),
        ],
        titleWidget: TextWidget(
          "Transactions",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const CommonAccountDetailContainer(
                    accountBalance: "\$10,000.00",
                    accountName: "Spendings Account",
                    accountNum: "1234   1234   4567   4589",
                    imagePath: AssetIcons.appIcon,
                    userName: "Tim Preston");
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(
            () => Visibility(
              visible: !transactionController.isShowSearchField.value,
              child: Row(
                children: [
                  TextWidget(
                    "Transactions",
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        transactionController.isShowSearchField.value = true;
                      },
                      child: Icon(
                        Icons.search,
                        color: context.theme.textTheme.titleMedium!.color,
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(
                            name: Routes.addTransactionScreen),
                        screen: const AddTransactionScreen(),
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    child: SvgPicture.asset(
                      AssetSvgs.addIcon,
                      color: context.theme.textTheme.titleMedium!.color,
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  InkWell(
                    onTap: () {
                      TransactionFilterBottomSheet.showModalSheet(
                          context, controller!);
                    },
                    child: SvgPicture.asset(
                      AssetSvgs.notificationFilter,
                      color: context.theme.textTheme.titleMedium!.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: transactionController.isShowSearchField.value,
              child: CupertinoSearchTextField(
                padding: const EdgeInsets.all(12),
                suffixMode: OverlayVisibilityMode.always,
                onSuffixTap: () {
                  transactionController.isShowSearchField.value = false;
                  transactionController.transactionList.value =
                      transactionController.tempTransactionList;
                },
                style:
                    TextStyle(color: context.theme.textTheme.titleLarge!.color),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColor.textSecondaryColor,
                ).marginOnly(left: 10),
                placeholder: "Search here...",
                onChanged: (value) async {
                  await transactionController.searchdata(value);
                },
                onSubmitted: (value) {},
                autocorrect: true,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactionController.transactionList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(
                            name: Routes.transactionDetailScreen),
                        screen: const TransactionDetailScreen(),
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 7),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: context.theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [commonBoxshdow()],
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
                            width: 3.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                    maxLine: 1,
                                    textAlign: TextAlign.start,
                                    transactionController
                                        .transactionList[index].first,
                                    fontWeight: FontWeight.w600,
                                    color: context
                                        .theme.textTheme.titleMedium!.color,
                                    fontSize: 12.sp),
                                const SizedBox(
                                  height: 4,
                                ),
                                InkWell(
                                  onTap: () {
                                    commonModalSheet(
                                      context,
                                      title: "Transaction categories",
                                      heigth: 2.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            "Category",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: context.theme.textTheme
                                                .titleMedium!.color,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Obx(
                                              ()=> Wrap(
                                              children: [
                                                for (var i = 0;
                                                    i <
                                                        transactionController
                                                            .transactionCategoryList
                                                            .length;
                                                    i++)
                                                  GestureDetector(
                                                    onTap: () {
                                                      transactionController
                                                          .transactionList[index]
                                                          .last = transactionController
                                                              .transactionCategoryList[
                                                          i];
                                                      Get.back();
                                                    },
                                                    child: Chip(
                                                      avatar: Container(
                                                          alignment: Alignment
                                                              .center,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: AppColor
                                                                      .pinkLightColor,
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: const TextWidget(
                                                            "👌🏻",
                                                            fontSize: 11,
                                                          )),
                                                      label: TextWidget(
                                                          transactionController
                                                                  .transactionCategoryList[
                                                              i],
                                                          fontSize: 10.sp,
                                                          color: context
                                                              .theme
                                                              .textTheme
                                                              .titleMedium!
                                                              .color),
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      side: const BorderSide(
                                                          color:
                                                              AppColor.greyColor),
                                                    ).marginOnly(right: 10),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Obx(
                                    () => FittedBox(
                                        child: CommonAvatarChip(
                                      title: transactionController
                                          .transactionList[index].last,
                                      avatar: '👌🏻',
                                    )),
                                  ),
                                ),
                                // SizedBox(
                                //   width: 120,
                                //   child: CommonDropDown(
                                //     context: context,
                                //     horizontalPadding: 0,
                                //     isCommonContainer: true,
                                //     isDropDown: true,
                                //     selectedItem:
                                //         transactionController.tempSelectedValue,
                                //     dropDownItems:
                                //         transactionController.tempItems,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextWidget("+\$3052.00",
                              fontWeight: FontWeight.w600,
                              color: AppColor.greenAssentColor,
                              fontSize: 12.sp),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          TextWidget(
            "Yesterday",
            color: context.theme.textTheme.titleMedium!.color,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: context.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [commonBoxshdow()],
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
                        width: 3.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                transactionController
                                    .transactionList[index].first,
                                maxLine: 1,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w600,
                                color:
                                    context.theme.textTheme.titleMedium!.color,
                                fontSize: 12.sp),
                            const SizedBox(
                              height: 4,
                            ),
                            InkWell(
                              onTap: () {
                                commonModalSheet(
                                  context,
                                  title: "Transaction categories",
                                  heigth: 2.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        "Category",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: context
                                            .theme.textTheme.titleMedium!.color,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Obx(
                                        ()=> Wrap(
                                          children: [
                                            for (var i = 0;
                                                i <
                                                    transactionController
                                                        .transactionCategoryList
                                                        .length;
                                                i++)
                                              GestureDetector(
                                                onTap: () {


                                                  transactionController
                                                          .yesterdayTransactionList[
                                                              index]
                                                          .last =
                                                      transactionController
                                                          .transactionCategoryList[i];
                                                  Get.back();
                                                },
                                                child: Chip(
                                                  avatar: Container(
                                                      alignment: Alignment.center,
                                                      decoration: const BoxDecoration(
                                                          color: AppColor
                                                              .pinkLightColor,
                                                          shape: BoxShape.circle),
                                                      child: const TextWidget(
                                                        "👌🏻",
                                                        fontSize: 11,
                                                      )),
                                                  label: TextWidget(
                                                      transactionController
                                                              .transactionCategoryList[
                                                          i],
                                                      fontSize: 10.sp,
                                                      color: context
                                                          .theme
                                                          .textTheme
                                                          .titleMedium!
                                                          .color),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  side: const BorderSide(
                                                      color: AppColor.greyColor),
                                                ).marginOnly(right: 10),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Obx(
                                () => FittedBox(
                                    child: CommonAvatarChip(
                                  title: transactionController
                                      .yesterdayTransactionList[index].last,
                                  avatar: '👌🏻',
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextWidget("\$35.00",
                          fontWeight: FontWeight.w600,
                          color: AppColor.redColor,
                          fontSize: 12.sp),
                    ],
                  ),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          TextWidget(
            "11th October",
            color: context.theme.textTheme.titleMedium!.color,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: context.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [commonBoxshdow()],
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
                        width: 3.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget("Ami Insurance",
                                maxLine: 1,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w600,
                                color:
                                    context.theme.textTheme.titleMedium!.color,
                                fontSize: 12.sp),
                            const SizedBox(
                              height: 4,
                            ),
                            InkWell(
                              onTap: () {
                                commonModalSheet(
                                  context,
                                  title: "Transaction categories",
                                  heigth: 2.5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        "Category",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: context
                                            .theme.textTheme.titleMedium!.color,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Obx(
                                          ()=> Wrap(
                                          children: [
                                            for (var i = 0;
                                                i <
                                                    transactionController
                                                        .transactionCategoryList
                                                        .length;
                                                i++)
                                              GestureDetector(
                                                onTap: () {


                                                  transactionController
                                                          .yesterdayTransactionList[
                                                              index]
                                                          .last =
                                                      transactionController
                                                          .transactionCategoryList[i];
                                                  Get.back();
                                                },
                                                child: Chip(
                                                  avatar: Container(
                                                      alignment: Alignment.center,
                                                      decoration: const BoxDecoration(
                                                          color: AppColor
                                                              .pinkLightColor,
                                                          shape: BoxShape.circle),
                                                      child: const TextWidget(
                                                        "👌🏻",
                                                        fontSize: 11,
                                                      )),
                                                  label: TextWidget(
                                                      transactionController
                                                              .transactionCategoryList[
                                                          i],
                                                      fontSize: 10.sp,
                                                      color: context
                                                          .theme
                                                          .textTheme
                                                          .titleMedium!
                                                          .color),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  side: const BorderSide(
                                                      color: AppColor.greyColor),
                                                ).marginOnly(right: 10),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Obx(
                                () => FittedBox(
                                    child: CommonAvatarChip(
                                  title: transactionController
                                      .yesterdayTransactionList[index].last,
                                  avatar: '👌🏻',
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextWidget("+\$3052.00",
                          fontWeight: FontWeight.w600,
                          color: AppColor.greenAssentColor,
                          fontSize: 12.sp),
                    ],
                  ),
                );
              }),
        ]),
      )),
    );
  }
}
