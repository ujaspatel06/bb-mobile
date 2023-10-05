// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/AddIncomeScreen/add_expense_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/AddIncomeScreen/add_income_expense_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/AddIncomeScreen/add_income_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/EditYourBudgetScreen/edit_your_budget_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/CashflowScreen/cashflow_controller.dart';
import 'package:budget_buddie/Utils/Utils.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/custom_rotation_icon.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class CashflowScreen extends StatefulWidget {
  const CashflowScreen({super.key});

  @override
  State<CashflowScreen> createState() => _CashflowScreenState();
}

class _CashflowScreenState extends State<CashflowScreen> {
  CashflowController cashflowController = Get.put(CashflowController());
  EditYourBudgetController editYourBudgetController =
      Get.put(EditYourBudgetController());
  AddIncomeExpenseController addIncomeExpenseController =
      Get.put(AddIncomeExpenseController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(15)),
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
                      RotatedBox(
                        quarterTurns: 1,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              color: AppColor.whiteColor,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            AssetSvgs.upDownIcon,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            "Week 1",
                            color: AppColor.whiteColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          TextWidget(
                            "Thursday 13th October",
                            color: AppColor.blueColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              color: AppColor.whiteColor,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                            AssetSvgs.upDownIcon,
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
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                TextWidget(
                  "Your income",
                  fontSize: 16.sp,
                  color: context.theme.textTheme.titleMedium!.color,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      boxShadow: [commonBoxshdow()],
                      borderRadius: BorderRadius.circular(15)),
                  child: CommonFormField(
                    context: context,
                    label: 'Spendings balance',
                    flex1: 3,
                    isCommonContainer: true,
                    flex2: 5,
                    fillColor:
                        SaprateLightDarkColor.greenLightColor.withOpacity(0.5),
                    suffixIcon: RotatingIconButton(
                        onTap: (val) {
                          cashflowController.isSpendingBalanceShow.value = val;
                        },
                        isShow: cashflowController.isSpendingBalanceShow.value,
                        borderRadius: 100.0,
                        rotateType: RotateType.semi,
                        clockwise: false,
                        background:
                            cashflowController.isSpendingBalanceShow.value
                                ? AppColor.greenAssentColor
                                : Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          child: SvgPicture.asset(
                            AssetSvgs.upDownIcon,
                            color: cashflowController
                                    .isSpendingBalanceShow.value
                                ? AppColor.whiteColor
                                : context.theme.textTheme.titleMedium!.color,
                          ),
                        )).marginOnly(left: 8),
                  ),
                ),
                if (cashflowController.isSpendingBalanceShow.value)
                  AnimationLimiter(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 300),
                            child: FadeInAnimation(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7),
                                child: Container(
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
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget("Credit Card",
                                                fontWeight: FontWeight.w600,
                                                color: context.theme.textTheme
                                                    .titleMedium!.color,
                                                fontSize: 13.sp),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextWidget("\$3052.00",
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    AppColor.greenAssentColor,
                                                fontSize: 12.sp),
                                          ],
                                        ),
                                        const Spacer(),
                                        Obx(
                                          () => CupertinoSwitch(
                                            onChanged: (bool value) {
                                              cashflowController
                                                  .spendingBalanceSwitch
                                                  .value = value;
                                            },
                                            value: cashflowController
                                                .spendingBalanceSwitch.value,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                SizedBox(
                  height: 1.h,
                ),
                Obx(
                  () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: editYourBudgetController.incomesList.length,
                      itemBuilder: (context, index) {
                        var incomeValue =
                            editYourBudgetController.incomesList[index];
                        return _commonIncomeBox(
                            incomeValue.incomeUuid ?? '',
                            incomeValue.incomeName ?? '',
                            incomeValue.incomeType ?? '',
                            parseTimeStampToString(
                                incomeValue.lastPaymentDate!),
                            incomeValue.incomeAmount.toString(),
                            incomeValue.howOften ?? '',
                            incomeValue.accountAssociated ?? '');
                      }),
                ),
                // Container(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //       color: context.theme.primaryColor,
                //       boxShadow: [commonBoxshdow()],
                //       borderRadius: BorderRadius.circular(15)),
                //   child: Column(children: [
                //     CommonFormField(
                //       context: context,
                //       label: 'Income Name',
                //       readOnly: true,
                //       hintText: "Pay",
                //       suffixIcon: InkWell(
                //         onTap: () {
                //           PersistentNavBarNavigator
                //               .pushNewScreenWithRouteSettings(
                //             context,
                //             settings: const RouteSettings(
                //                 name: Routes.addIncomeExpenseScreen),
                //             screen: const AddIncomeScreen(),
                //             pageTransitionAnimation:
                //                 PageTransitionAnimation.fade,
                //           );
                //         },
                //         child: Container(
                //           height: 30,
                //           width: 30,
                //           decoration: const BoxDecoration(
                //               shape: BoxShape.circle,
                //               color: AppColor.greenAssentColor),
                //           child: const Icon(Icons.arrow_forward_ios_rounded,
                //               size: 20, color: AppColor.whiteColor),
                //         ).marginOnly(left: 12),
                //       ),
                //       isCommonContainer: true,
                //       flex2: 2,
                //     ),
                //     CommonFormField(
                //       context: context,
                //       label: 'Last pay day date',
                //       readOnly: true,
                //       hintText: "11-09-2023",
                //       isCommonContainer: true,
                //     ),
                //     CommonFormField(
                //       context: context,
                //       label: 'Income amount',
                //       readOnly: true,
                //       hintText: "\$299",
                //       isCommonContainer: true,
                //     ),
                //     CommonFormField(
                //       context: context,
                //       label: 'How often?',
                //       flex2: 2,
                //       readOnly: true,
                //       hintText: "Monthly",
                //       isCommonContainer: true,
                //     ),
                //   ]),
                // ),
                const SizedBox(
                  height: 20,
                ),

                // CommonFormField(
                //   context: context,
                //   label: 'Pay',
                //   flex1: 3,
                //   flex2: 5,
                // ),
                // CommonFormField(
                //   context: context,
                //   label: 'Rental Income',
                //   flex1: 3,
                //   flex2: 5,
                // ),
                // CommonFormField(
                //   context: context,
                //   label: 'Investments',
                //   flex1: 3,
                //   flex2: 5,
                // ),
                // CommonFormField(
                //   context: context,
                //   label: 'Other',
                //   flex1: 3,
                //   flex2: 5,
                // ),
                // SizedBox(
                //   height: 2.h,
                // ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      boxShadow: [commonBoxshdow()],
                      borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                        context,
                        settings: const RouteSettings(
                            name: Routes.addIncomeExpenseScreen),
                        screen: const AddIncomeScreen(),
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                      TextWidget(
                        "Add income",
                        fontSize: 12.sp,
                        color: context.theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w500,
                      ),
                    ]),
                  ),
                ),

                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              TextWidget(
                "Your Expenses",
                fontSize: 16.sp,
                color: context.theme.textTheme.titleMedium!.color,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 1.h,
              ),

              Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: editYourBudgetController.expensesList.length,
                    itemBuilder: (context, index) {
                      var expenseValue =
                          editYourBudgetController.expensesList[index];
                      return _commonExpenseBox(
                          expenseValue.expenseUuid ?? '',
                          expenseValue.expenseType ?? '',
                          parseTimeStampToString(
                              expenseValue.lastPaymentDate ?? ''),
                          expenseValue.expenseAmount.toString(),
                          expenseValue.howOften ?? '',
                          expenseValue.accountAssociated ?? '');
                    }),
              ),
              // CommonFormField(
              //   context: context,
              //   label: 'Food',
              //   flex1: 3,
              //   flex2: 5,
              // ),
              // CommonFormField(
              //   context: context,
              //   label: 'Power/Wifi',
              //   flex1: 3,
              //   flex2: 5,
              // ),
              // CommonFormField(
              //   context: context,
              //   label: 'Insurance',
              //   flex1: 3,
              //   flex2: 5,
              // ),
              // CommonFormField(
              //   context: context,
              //   label: 'Car',
              //   flex1: 3,
              //   flex2: 5,
              // ),
              // CommonFormField(
              //   context: context,
              //   label: 'Mortgage',
              //   flex1: 3,
              //   flex2: 5,
              // ),
              // CommonFormField(
              //   context: context,
              //   label: 'Rates',
              //   flex1: 3,
              //   flex2: 5,
              // ),
              // CommonFormField(
              //   context: context,
              //   label: 'Eating out',
              //   flex1: 3,
              //   flex2: 5,
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),

              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //       color: context.theme.primaryColor,
              //       boxShadow: [commonBoxshdow()],
              //       borderRadius: BorderRadius.circular(15)),
              //   child: Column(children: [
              //     CommonFormField(
              //       context: context,
              //       label: 'Expense Name',
              //       readOnly: true,
              //       hintText: "Food",
              //       suffixIcon: InkWell(
              //         onTap: () {
              //           PersistentNavBarNavigator
              //               .pushNewScreenWithRouteSettings(
              //             context,
              //             settings: const RouteSettings(
              //                 name: Routes.addIncomeExpenseScreen),
              //             screen: const AddExpenseScreen(),
              //             pageTransitionAnimation: PageTransitionAnimation.fade,
              //           );
              //         },
              //         child: Container(
              //           height: 30,
              //           width: 30,
              //           decoration: const BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: AppColor.greenAssentColor),
              //           child: const Icon(Icons.arrow_forward_ios_rounded,
              //               size: 20, color: AppColor.whiteColor),
              //         ).marginOnly(left: 12),
              //       ),
              //       isCommonContainer: true,
              //       flex2: 2,
              //     ),
              //     CommonFormField(
              //       context: context,
              //       label: 'Last payment date',
              //       readOnly: true,
              //       hintText: "11-09-2023",
              //       isCommonContainer: true,
              //     ),
              //     CommonFormField(
              //       context: context,
              //       label: 'Expense amount',
              //       readOnly: true,
              //       hintText: "\$299",
              //       isCommonContainer: true,
              //     ),
              //     CommonFormField(
              //       context: context,
              //       label: 'How often?',
              //       flex2: 2,
              //       readOnly: true,
              //       hintText: "Monthly",
              //       isCommonContainer: true,
              //     ),
              //   ]),
              // ),
              const SizedBox(
                height: 20,
              ),

              Container(
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    boxShadow: [commonBoxshdow()],
                    borderRadius: BorderRadius.circular(12)),
                child: InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(
                          name: Routes.addIncomeExpenseScreen),
                      screen: const AddExpenseScreen(),
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                    TextWidget(
                      "Add expense",
                      fontSize: 12.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ]),
                ),
              ),

              SizedBox(
                height: 6.h,
              ),
              TextWidget(
                "Your money left over",
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
                    color: box.read(GetStorageKey.themeMode) ?? false
                        ? SaprateLightDarkColor.cyanColor
                        : SaprateLightDarkColor.greenLightColor,
                    boxShadow: [commonBoxshdow()],
                    borderRadius: BorderRadius.circular(12)),
                child: Row(children: [
                  TextWidget(
                    "Balance left over",
                    fontSize: 13.sp,
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  TextWidget(
                    "\$10,000",
                    fontSize: 13.sp,
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ]),
              ),
            ],
          ),
          const SizedBox(
            height: 56,
          ),
          Container(
            height: 270,
            decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [commonBoxshdow(blurRadius: 30)]),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            "Weekly Cashflow",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: context.theme.textTheme.titleMedium!.color,
                          ),
                          const Spacer(),
                          TextWidget(
                            "\$13,780",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.greenAssentColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                        "Week 5 - 12/11/2022",
                        fontSize: 12.sp,
                        color: AppColor.greyColor,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 150,
                      child: LineChart(
                        mainData(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }

  Widget _commonIncomeBox(
      String incomeUuid,
      String incomeName,
      String incomeType,
      String lastDate,
      String incomeAmount,
      String howOften,
      String asoAccount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: context.theme.primaryColor,
          boxShadow: [commonBoxshdow()],
          borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        CommonFormField(
          context: context,
          label: 'Income Name',
          readOnly: true,
          hintText: incomeName,
          suffixIcon: InkWell(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                context,
                settings:
                    const RouteSettings(name: Routes.addIncomeExpenseScreen),
                screen: AddIncomeScreen(
                    isEdit: true,
                    incomeUuid: incomeUuid,
                    assoAccount: asoAccount,
                    howOften: howOften,
                    incomeAmount: incomeAmount,
                    incomeName: incomeName,
                    incomeType: incomeType,
                    lastPayDate: lastDate),
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.greenAssentColor),
              child: const Icon(Icons.arrow_forward_ios_rounded,
                  size: 20, color: AppColor.whiteColor),
            ).marginOnly(left: 12),
          ),
          isCommonContainer: true,
          flex2: 2,
        ),
        CommonFormField(
          context: context,
          label: 'Income Type',
          readOnly: true,
          hintText:
              addIncomeExpenseController.incomeTypeItems[incomeType] ?? '',
          isCommonContainer: true,
          flex2: 2,
        ),
        CommonFormField(
          context: context,
          label: 'Last pay day date',
          readOnly: true,
          hintText: lastDate,
          isCommonContainer: true,
        ),
        CommonFormField(
          context: context,
          label: 'Income amount',
          readOnly: true,
          hintText: "\$$incomeAmount",
          isCommonContainer: true,
        ),
        CommonFormField(
          context: context,
          label: 'How often?',
          flex2: 2,
          readOnly: true,
          hintText: addIncomeExpenseController.howOftenItems[howOften] ?? '',
          isCommonContainer: true,
        ),
        CommonFormField(
          context: context,
          label: 'Associated Account',
          flex2: 2,
          readOnly: true,
          hintText: asoAccount,
          isCommonContainer: true,
        ),
      ]),
    );
  }

  Widget _commonExpenseBox(
      String expenseUuid,
      String expenseType,
      String lastDate,
      String expenseAmount,
      String howOften,
      String asoAccount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: context.theme.primaryColor,
          boxShadow: [commonBoxshdow()],
          borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        CommonFormField(
          context: context,
          label: 'Expense Type',
          readOnly: true,
          hintText:
              addIncomeExpenseController.incomeTypeItems[expenseType] ?? '',
          suffixIcon: InkWell(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                context,
                settings:
                    const RouteSettings(name: Routes.addIncomeExpenseScreen),
                screen: AddExpenseScreen(
                    isEdit: true,
                    incomeUuid: expenseUuid,
                    assoAccount: asoAccount,
                    howOften: howOften,
                    incomeAmount: expenseAmount,
                    incomeType: expenseType,
                    lastPayDate: lastDate),
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColor.greenAssentColor),
              child: const Icon(Icons.arrow_forward_ios_rounded,
                  size: 20, color: AppColor.whiteColor),
            ).marginOnly(left: 12),
          ),
          isCommonContainer: true,
          flex2: 2,
        ),
        CommonFormField(
          context: context,
          label: 'Last payment date',
          readOnly: true,
          hintText: lastDate,
          isCommonContainer: true,
        ),
        CommonFormField(
          context: context,
          label: 'Expense amount',
          readOnly: true,
          hintText: "\$$expenseAmount",
          isCommonContainer: true,
        ),
        CommonFormField(
          context: context,
          label: 'How often?',
          flex2: 2,
          readOnly: true,
          hintText: addIncomeExpenseController.howOftenItems[howOften] ?? '',
          isCommonContainer: true,
        ),
        CommonFormField(
          context: context,
          label: 'Associated Account',
          flex2: 2,
          readOnly: true,
          hintText: asoAccount,
          isCommonContainer: true,
        ),
      ]),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: const LineTouchData(
          touchTooltipData: LineTouchTooltipData(
              showOnTopOfTheChartBoxArea: false,
              tooltipBgColor: Colors.transparent)),
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.red,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.red,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: const FlTitlesData(
        show: false,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        // bottomTitles: AxisTitles(
        //   sideTitles: SideTitles(
        //     showTitles: false,
        //     reservedSize: 30,
        //     interval: 1,
        //     getTitlesWidget: bottomTitleWidgets,
        //   ),
        // ),
        // leftTitles: AxisTitles(
        //   sideTitles: SideTitles(
        //     showTitles: false,
        //     interval: 1,
        //     getTitlesWidget: leftTitleWidgets,
        //     reservedSize: 42,
        //   ),
        // ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: Colors.green.shade600,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.green.shade600.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
