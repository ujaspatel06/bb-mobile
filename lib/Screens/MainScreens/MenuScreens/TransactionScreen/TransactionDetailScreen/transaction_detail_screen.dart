// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/SplitTransactionScreen/split_transaction_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/TransactionDetailScreen/transaction_detail_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_avatar_chip.dart';
import 'package:budget_buddie/Utils/Widgets/common_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class TransactionDetailScreen extends StatefulWidget {
  const TransactionDetailScreen({super.key});

  @override
  State<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  TransactionDetailController transactionDetailController =
      Get.put(TransactionDetailController());

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
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              AssetSvgs.closeIcon,
              color: context.theme.textTheme.titleMedium!.color,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
        ],
        titleWidget: TextWidget(
          "Transaction details",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(6),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        boxShadow: [commonBoxshdow(blurRadius: 30)],
                        color: Colors.grey,
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextWidget("AMI Insurance",
                        fontWeight: FontWeight.w700,
                        color: context.theme.textTheme.titleMedium!.color,
                        fontSize: 14.sp),
                  ),
                  TextWidget("12:15pm | 13/10/2022",
                      fontWeight: FontWeight.w400,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontSize: 8.sp),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 45,
                    width: 170,
                    padding: const EdgeInsets.all(13),
                    decoration: ShapeDecoration(
                      color: context.theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [commonBoxshdow(blurRadius: 30)],
                    ),
                    child: TextWidget(
                      "-\$15.00",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.redColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget("\$350.50 ",
                          fontWeight: FontWeight.w400,
                          color: AppColor.greenAssentColor,
                          fontSize: 9.sp),
                      TextWidget(" available after transaction",
                          fontWeight: FontWeight.w400,
                          color: context.theme.textTheme.titleMedium!.color,
                          fontSize: 9.sp),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    "Merchant",
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CommonFormField(
                    context: context,
                    label: 'Ami insurance',
                    flex1: 4,
                    flex2: 3,
                    onlyStackIcon: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: InkWell(
                        onTap: () {
                          commonModalSheet(
                            context,
                            title: "Transaction categories",
                            heigth: 2.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  () => Wrap(
                                    children: [
                                      for (var i = 0;
                                          i <
                                              transactionDetailController
                                                  .transactionDetailList.length;
                                          i++)
                                        GestureDetector(
                                          onTap: () {
                                            transactionDetailController
                                                    .transactionDetailSelectItem
                                                    .value =
                                                transactionDetailController
                                                    .transactionDetailList[i]
                                                    .last;
                                            Get.back();
                                          },
                                          child: Chip(
                                            avatar: Container(
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                    color:
                                                        AppColor.pinkLightColor,
                                                    shape: BoxShape.circle),
                                                child: const TextWidget(
                                                  "👌🏻",
                                                  fontSize: 11,
                                                )),
                                            label: TextWidget(
                                                transactionDetailController
                                                    .transactionDetailList[i]
                                                    .last,
                                                fontSize: 10.sp,
                                                color: context.theme.textTheme
                                                    .titleMedium!.color),
                                            backgroundColor: Colors.transparent,
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
                            alignment: Alignment.centerRight,
                            child: CommonAvatarChip(
                              title: transactionDetailController
                                  .transactionDetailSelectItem.value,
                              avatar: '👌🏻',
                            ),
                          ),
                        ),
                      ),
                    ),
                    prefixIcon: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: context.theme.canvasColor,
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.asset(AssetIcons.appIcon))
                        .marginOnly(right: 12),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    "Account",
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: context.theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadows: [commonBoxshdow(blurRadius: 30)],
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget("Everyday account",
                                  fontWeight: FontWeight.w600,
                                  maxLine: 1,
                                  textAlign: TextAlign.start,
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontSize: 12.sp),
                              const SizedBox(
                                height: 5,
                              ),
                              TextWidget("15-8478-383737-05",
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.textSecondaryColor,
                                  fontSize: 10.sp),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget("\$3052.00",
                            fontWeight: FontWeight.w600,
                            color: AppColor.greenAssentColor,
                            fontSize: 12.sp),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    "Want to split this transaction?",
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(
                            name: Routes.splitTransactionScreen),
                        screen: const SplitTransactionScreen(),
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: context.theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadows: [commonBoxshdow(blurRadius: 30)],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.greenAssentColor,
                            ),
                            child: const Icon(
                              Icons.format_list_bulleted_rounded,
                              color: AppColor.whiteColor,
                            ),
                          ).marginOnly(left: 10),
                          const SizedBox(
                            width: 20,
                          ),
                          TextWidget("Split transaction here",
                              fontWeight: FontWeight.w600,
                              color: context.theme.textTheme.titleMedium!.color,
                              fontSize: 13.sp),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
