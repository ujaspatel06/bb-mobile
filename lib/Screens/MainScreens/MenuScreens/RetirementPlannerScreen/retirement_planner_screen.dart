import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/RetirementPlannerScreen/AddAccountAssetScreen/add_account_asset_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/RetirementPlannerScreen/Components/retirement_planner_expension_widget.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/RetirementPlannerScreen/retirement_planner_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_dropdown.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class RetirementPlannerScreen extends StatefulWidget {
  const RetirementPlannerScreen({super.key});

  @override
  State<RetirementPlannerScreen> createState() =>
      _RetirementPlannerScreenState();
}

class _RetirementPlannerScreenState extends State<RetirementPlannerScreen> {
  RetirementPlannerController retirementPlannerController =
      Get.put(RetirementPlannerController());
  @override
  void dispose() {
    retirementPlannerController.saveAccountData();
    retirementPlannerController.saveAssetData();
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
          const SizedBox(
            width: 14,
          ),
        ],
        titleWidget: TextWidget(
          "Retirement planner",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget("Your current & retirement age",
                    fontWeight: FontWeight.w600,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 15.sp),
                SizedBox(
                  height: 1.h,
                ),
                CommonFormField(
                  context: context,
                  label: 'Current age',
                  flex1: 2,
                  flex2: 2,
                ),
                CommonFormField(
                  context: context,
                  label: 'Preferred retirement age',
                  flex1: 3,
                  flex2: 1,
                ),
                CommonFormField(
                  context: context,
                  label: 'Length of retirement',
                  flex1: 3,
                  flex2: 1,
                ),
                SizedBox(
                  height: 3.h,
                ),
                TextWidget("Your accounts & Assets",
                    fontWeight: FontWeight.w600,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 15.sp),
                SizedBox(
                  height: 1.h,
                ),

                Obx(
                  () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: retirementPlannerController
                          .accountAssetDataList.length,
                      itemBuilder: (context, index) {
                        final accountData = retirementPlannerController
                            .accountAssetDataList[index];

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 7),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: context.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [commonBoxshdow(blurRadius: 30)],
                          ),
                          child: Slidable(
                            key: ValueKey(accountData),
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              extentRatio: 0.17,
                              children: [
                                SlidableAction(
                                  onPressed: (data) {
                                    int ind = 0;
                                    for (var i in retirementPlannerController
                                        .yourAccountData) {
                                      if (i.title ==
                                          retirementPlannerController
                                              .accountAssetDataList[index]
                                              .title) {
                                        retirementPlannerController
                                            .yourAccountData[ind]
                                            .isSwitched = false;
                                      }

                                      ind++;
                                    }

                                    retirementPlannerController
                                            .accountAssetDataList.value =
                                        retirementPlannerController
                                            .yourAccountData
                                            .where((e) => e.isSwitched == true)
                                            .toList();
                                  },
                                  backgroundColor: AppColor.redColor,
                                  foregroundColor: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  icon: Icons.remove,
                                ),
                              ],
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
                                    child: TextWidget(
                                        retirementPlannerController
                                            .accountAssetDataList[index].title!,
                                        textAlign: TextAlign.start,
                                        maxLine: 1,
                                        fontWeight: FontWeight.w600,
                                        color: context
                                            .theme.textTheme.titleMedium!.color,
                                        fontSize: 13.sp),
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
                          ),
                        );
                      }),
                ),

                Obx(
                  () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: retirementPlannerController
                          .accountAssetDataList2.length,
                      itemBuilder: (context, index) {
                        final accountData = retirementPlannerController
                            .accountAssetDataList[index];

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 7),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: context.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [commonBoxshdow(blurRadius: 30)],
                          ),
                          child: Slidable(
                            key: ValueKey(accountData),
                            startActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              extentRatio: 0.17,
                              children: [
                                SlidableAction(
                                  onPressed: (data) {
                                    int ind = 0;
                                    for (var i in retirementPlannerController
                                        .yourAssetData) {
                                      if (i.title ==
                                          retirementPlannerController
                                              .accountAssetDataList2[index]
                                              .title) {
                                        retirementPlannerController
                                            .yourAssetData[ind]
                                            .isSwitched = false;
                                      }

                                      ind++;
                                    }

                                    retirementPlannerController
                                            .accountAssetDataList2.value =
                                        retirementPlannerController
                                            .yourAssetData
                                            .where((e) => e.isSwitched == true)
                                            .toList();
                                  },
                                  backgroundColor: AppColor.redColor,
                                  foregroundColor: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  icon: Icons.remove,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            textAlign: TextAlign.start,
                                            maxLine: 1,
                                            retirementPlannerController
                                                .accountAssetDataList2[index]
                                                .title!,
                                            fontWeight: FontWeight.w600,
                                            color: context.theme.textTheme
                                                .titleMedium!.color,
                                            fontSize: 13.sp),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        TextWidget(
                                          textAlign: TextAlign.start,
                                          maxLine: 1,
                                          "Value: \$530,000 ",
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.greenAssentColor,
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
                            ),
                          ),
                        );
                      }),
                ),

                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           TextWidget("House",
                //               fontWeight: FontWeight.w600,
                //               color: context.theme.textTheme.titleMedium!.color,
                //               fontSize: 13.sp),
                //           const SizedBox(
                //             height: 3,
                //           ),
                //           Row(
                //             children: [
                //               TextWidget(
                //                 "Value: \$530,000 ",
                //                 fontSize: 10.sp,
                //                 fontWeight: FontWeight.w500,
                //                 color: AppColor.greenAssentColor,
                //               ),
                //               TextWidget(
                //                 " | ",
                //                 fontSize: 10.sp,
                //                 fontWeight: FontWeight.w600,
                //                 color:
                //                     context.theme.textTheme.titleMedium!.color,
                //               ),
                //               TextWidget(
                //                 " Owing: \$300,000",
                //                 fontSize: 10.sp,
                //                 fontWeight: FontWeight.w500,
                //                 color: AppColor.redColor,
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),

                SizedBox(
                  height: 1.h,
                ),
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(
                          name: Routes.addAccountAssetScreen),
                      screen: const AddAccountAssetScreen(),
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 30,
                        )),
                    TextWidget(
                      "Add account or Asset",
                      fontSize: 12.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 5.h,
                ),
                TextWidget("Your contributions",
                    fontWeight: FontWeight.w600,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 15.sp),
                SizedBox(
                  height: 1.h,
                ),
                RetirementExpensionTile(
                  lable: "Savings account",
                  imagePath: AssetIcons.appIcon,
                  downWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonFormField(
                        context: context,
                        label: 'Contribution amount',
                        flex1: 2,
                        isCommonContainer: true,
                        flex2: 2,
                      ),
                      CommonFormField(
                        context: context,
                        label: 'How often?',
                        flex1: 1,
                        flex2: 2,
                        isCommonContainer: true,
                        isDropDown: true,
                        selectedItem:
                            retirementPlannerController.tempSelectedValue,
                        dropDownItems: retirementPlannerController.tempItems,
                      ),
                      CommonFormField(
                        context: context,
                        label: 'Account Interest rate',
                        flex1: 2,
                        isCommonContainer: true,
                        flex2: 2,
                      ),
                    ],
                  ),
                ),
                RetirementExpensionTile(
                  lable: "Kiwisaver",
                  imagePath: AssetIcons.appIcon,
                  downWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonFormField(
                        context: context,
                        label: 'Your income',
                        flex1: 1,
                        flex2: 1,
                        isCommonContainer: true,
                        suffixIcon: Expanded(
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      context.theme.textTheme.labelLarge!.color,
                                  constraints: const BoxConstraints(
                                      maxHeight: 40, minHeight: 40),
                                  contentPadding: const EdgeInsets.all(10),
                                  isDense: false,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Obx(
                                    () => DropdownButton<String>(
                                      value: retirementPlannerController
                                          .tempSelectedValue.value,
                                      isDense: false,
                                      elevation: 0,
                                      onTap: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: context.theme.textTheme
                                            .titleMedium!.color!,
                                      ),
                                      onChanged: (String? newValue) {
                                        retirementPlannerController
                                            .tempSelectedValue
                                            .value = newValue!;
                                      },
                                      isExpanded: true,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: context
                                            .theme.textTheme.titleMedium!.color,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      items: retirementPlannerController
                                          .tempItems.entries
                                          .map((map) {
                                        return DropdownMenuItem<String>(
                                          value: map.key,
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Text(map.value, maxLines: 1),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).marginOnly(left: 12),
                        ),
                      ),
                      CommonFormField(
                        context: context,
                        label: 'Fund type',
                        flex1: 1,
                        flex2: 2,
                        isCommonContainer: true,
                        isDropDown: true,
                        selectedItem:
                            retirementPlannerController.tempSelectedValue,
                        dropDownItems: retirementPlannerController.tempItems,
                      ),
                      CommonFormField(
                        context: context,
                        label: 'Annual growth rate',
                        flex1: 2,
                        flex2: 2,
                        isCommonContainer: true,
                        isDropDown: true,
                        selectedItem:
                            retirementPlannerController.tempSelectedValue,
                        dropDownItems: retirementPlannerController.tempItems,
                      ),
                      CommonFormField(
                        context: context,
                        label: 'Contribution rate',
                        flex1: 2,
                        flex2: 2,
                        isCommonContainer: true,
                        isDropDown: true,
                        selectedItem:
                            retirementPlannerController.tempSelectedValue,
                        dropDownItems: retirementPlannerController.tempItems,
                      ),
                      CommonFormField(
                        context: context,
                        label: 'Employer contribution',
                        flex1: 2,
                        flex2: 2,
                        isCommonContainer: true,
                        isDropDown: true,
                        selectedItem:
                            retirementPlannerController.tempSelectedValue,
                        dropDownItems: retirementPlannerController.tempItems,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Disclaimer : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: context
                                        .theme.textTheme.titleMedium!.color),
                              ),
                              TextSpan(
                                  style: TextStyle(
                                      color: context
                                          .theme.textTheme.titleMedium!.color!,
                                      fontSize: 9.sp),
                                  text:
                                      ' Kiwisaver fund growth rates are based on rates provided by the fund. If the rates differ to what’s listed, this can be edited.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RetirementExpensionTile(
                  lable: "Sharesies",
                  imagePath: AssetIcons.appIcon,
                  downWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonFormField(
                        context: context,
                        label: 'Contribution amount',
                        flex1: 2,
                        isCommonContainer: true,
                        flex2: 2,
                      ),
                      CommonFormField(
                        context: context,
                        label: 'How often?',
                        flex1: 1,
                        flex2: 2,
                        isCommonContainer: true,
                        isDropDown: true,
                        selectedItem:
                            retirementPlannerController.tempSelectedValue,
                        dropDownItems: retirementPlannerController.tempItems,
                      ),
                      CommonFormField(
                        context: context,
                        label: 'Annual investment return',
                        flex1: 2,
                        isCommonContainer: true,
                        flex2: 2,
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => RetirementExpensionTile(
                    lable: "",
                    imagePath: "",
                    onTap: (p0) {
                      retirementPlannerController.isHouseExpensionShow.value =
                          p0;
                    },
                    upWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget("House",
                            fontWeight: FontWeight.w600,
                            color: context.theme.textTheme.titleMedium!.color,
                            fontSize: 14.sp),
                        const SizedBox(
                          height: 6,
                        ),
                        Visibility(
                          visible: !retirementPlannerController
                              .isHouseExpensionShow.value,
                          child: Row(
                            children: [
                              TextWidget(
                                "Value: \$530,000 ",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.greenAssentColor,
                              ),
                              TextWidget(
                                " | ",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color:
                                    context.theme.textTheme.titleMedium!.color,
                              ),
                              TextWidget(
                                " Owing: \$300,000",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.redColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    downWidget: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Asset value amount: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                      color: context
                                          .theme.textTheme.titleMedium!.color),
                                ),
                                TextSpan(
                                    style: TextStyle(
                                        color: AppColor.greenAssentColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp),
                                    text: ' \$530,000'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Asset owing amount: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                      color: context
                                          .theme.textTheme.titleMedium!.color),
                                ),
                                TextSpan(
                                    style: TextStyle(
                                        color: AppColor.redColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                    text: ' \$530,000'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Asset net value: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                      color: context
                                          .theme.textTheme.titleMedium!.color),
                                ),
                                TextSpan(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.greenAssentColor,
                                      fontSize: 12.sp),
                                  text: ' \$530,000',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 34,
                          ),
                          CustomButton(
                            buttonText: 'Edit asset',
                            backgroundColor: AppColor.darkBlueColor,
                            onBtnPress: () {},
                            width: 13.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextWidget("What you’ll have at retirement",
                    fontWeight: FontWeight.w600,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 15.sp),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        padding: const EdgeInsets.all(10),
                        clipBehavior: Clip.antiAlias,
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
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextWidget("Savings account",
                                  fontWeight: FontWeight.w600,
                                  maxLine: 1,
                                  textAlign: TextAlign.start,
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontSize: 13.sp),
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
                Container(
                  clipBehavior: Clip.antiAlias,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  decoration: ShapeDecoration(
                    color: SaprateLightDarkColor.greenLightColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [commonBoxshdow(blurRadius: 30)],
                  ),
                  child: Row(
                    children: [
                      TextWidget("Total amount",
                          fontWeight: FontWeight.w600,
                          color: context.theme.primaryColor,
                          fontSize: 13.sp),
                      const Spacer(),
                      TextWidget("\$44,463",
                          fontWeight: FontWeight.w600,
                          color: context.theme.primaryColor,
                          fontSize: 12.sp),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextWidget("NZ Super & Veteran Pension Payments ",
                    fontWeight: FontWeight.w600,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 15.sp),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                    "See what pension payments you’ll receive as of todays rates.",
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 11.sp),
                const SizedBox(
                  height: 10,
                ),
                CommonFormField(
                  context: context,
                  label: 'Your income (Pre-tax)',
                ),
                CommonFormField(
                  context: context,
                  label: 'NZ Super option',
                  isDropDown: true,
                  selectedItem: retirementPlannerController.tempSelectedValue,
                  dropDownItems: retirementPlannerController.tempItems,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    TextWidget(
                      "Taxed retirement income",
                      fontSize: 15.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w600,
                    ),
                    const Spacer(),
                    Obx(
                      () => CustomDropdownButtonWithList(
                        dropDownList: retirementPlannerController.tempItemsList,
                        onChanged: (String? value) {
                          retirementPlannerController.tempSelectedValue2.value =
                              value!;
                        },
                        value: retirementPlannerController
                            .tempSelectedValue2.value,
                        hint: '',
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
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
                      Center(
                        child: TextWidget(
                          "\$765.50",
                          color: AppColor.whiteColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
