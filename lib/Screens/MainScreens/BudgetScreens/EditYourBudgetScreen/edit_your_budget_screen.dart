// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/AddIncomeScreen/add_expense_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/AddIncomeScreen/add_income_expense_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/AddIncomeScreen/add_income_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/EditYourBudgetScreen/edit_your_budget_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/account_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Utils/Utils.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

class EditYourBudgetScreen extends StatefulWidget {
  const EditYourBudgetScreen({super.key});

  @override
  State<EditYourBudgetScreen> createState() => _EditYourBudgetScreenState();
}

class _EditYourBudgetScreenState extends State<EditYourBudgetScreen> {
  EditYourBudgetController editYourBudgetController =
      Get.put(EditYourBudgetController());
  AccountController accountController = Get.put(AccountController());

  AddIncomeExpenseController addIncomeExpenseController =
      Get.put(AddIncomeExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          IconButton(
            onPressed: () {
              commonModalSheet(
                context,
                title: "Editing your budget",
                heigth: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      "Editing your budget is nice & easy enter in the details around your regular income like the amount. name, when you last got paid and how often you get paid.\n\nNow enter in your details around your expenses. Same as income, enter in the amount and how often. To make things super simple, hit auto expense and we'll do the work for you.\n\nCheck out our instructional video for guidance.",
                      fontSize: 11.sp,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      color: AppColor.greyColor,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            buttonText: "Instructional Video 💸",
                            fontSize: 11.sp,
                            onBtnPress: () {},
                            backgroundColor: AppColor.darkCyanColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomButton(
                            width: 45,
                            fontSize: 11.sp,
                            buttonText: "I'm good to go 👌🏻",
                            onBtnPress: () {},
                            backgroundColor: AppColor.buttonGreenColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.info_outline_rounded,
              color: context.theme.textTheme.titleMedium!.color,
            ),
          ),
          InkWell(
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
          "Edit your budget",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          physics: const BouncingScrollPhysics(),
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
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                "View budget summary",
                                color: AppColor.whiteColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              TextWidget(
                                "Get the full overview.",
                                color: AppColor.blueColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: RotatedBox(
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
                          ),
                        ],
                      ),
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
                    "Your income",
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
                  const SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       color: context.theme.primaryColor,
                  //       boxShadow: [commonBoxshdow()],
                  //       borderRadius: BorderRadius.circular(12)),
                  //   child: Column(children: [
                  //     CommonFormField(
                  //       context: context,
                  //       label: 'Pay',
                  //       flex1: 3,
                  //       flex2: 5,
                  //       isCommonContainer: true,
                  //     ),
                  //     CommonFormField(
                  //         context: context,
                  //         label: 'Income name',
                  //         flex1: 1,
                  //         flex2: 2,
                  //         isDropDown: true,
                  //         selectedItem:
                  //             editYourBudgetController.tempSelectedValue,
                  //         dropDownItems: editYourBudgetController.howOftenItems,
                  //         isCommonContainer: true),
                  //     CommonFormField(
                  //         context: context,
                  //         label: 'Last pay day date',
                  //         isCommonContainer: true),
                  //     CommonFormField(
                  //       context: context,
                  //       label: 'How often?',
                  //       flex1: 1,
                  //       flex2: 2,
                  //       isCommonContainer: true,
                  //       isDropDown: true,
                  //       selectedItem:
                  //           editYourBudgetController.tempSelectedValue,
                  //       dropDownItems: editYourBudgetController.howOftenItems,
                  //     ),
                  //   ]),
                  // ),
                  // SizedBox(
                  //   height: 1.h,
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
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
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
                    height: 6.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: box.read(GetStorageKey.themeMode) ?? false
                            ? SaprateLightDarkColor.cyanColor
                            : SaprateLightDarkColor.greenLightColor,
                        boxShadow: [commonBoxshdow()],
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(children: [
                      TextWidget(
                        "Total monthly income",
                        fontSize: 13.sp,
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      Obx(
                        () => TextWidget(
                          "\$ ${editYourBudgetController.totalIncomeValue}",
                          fontSize: 13.sp,
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        "Your Expenses",
                        fontSize: 16.sp,
                        color: context.theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w700,
                      ),
                      Container(
                        // width: 165,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: box.read(GetStorageKey.themeMode) ?? false
                                ? SaprateLightDarkColor.cyanColor
                                : SaprateLightDarkColor.greenLightColor,
                            boxShadow: [commonBoxshdow()],
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                "Auto expense",
                                fontSize: 12.sp,
                                color: context.theme.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                              Image.asset(
                                AssetPngs.autoExpensesIcon,
                                height: 25,
                                color: context.theme.primaryColor,
                              )
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.2.h,
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
                  const SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       color: context.theme.primaryColor,
                  //       boxShadow: [commonBoxshdow()],
                  //       borderRadius: BorderRadius.circular(12)),
                  //   child: Column(children: [
                  //     CommonFormField(
                  //       context: context,
                  //       label: 'Food',
                  //       flex1: 3,
                  //       flex2: 5,
                  //       isCommonContainer: true,
                  //     ),
                  //     CommonFormField(
                  //         context: context,
                  //         label: 'How often?',
                  //         flex1: 1,
                  //         flex2: 2,
                  //         isDropDown: true,
                  //         selectedItem:
                  //             editYourBudgetController.tempSelectedValue,
                  //         dropDownItems: editYourBudgetController.howOftenItems,
                  //         isCommonContainer: true),
                  //     CommonFormField(
                  //         context: context,
                  //         label: 'Last payment date',
                  //         isCommonContainer: true),
                  //   ]),
                  // ),
                  // SizedBox(
                  //   height: 1.h,
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
                  // CommonFormField(
                  //   context: context,
                  //   label: 'Clothes',
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
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings: const RouteSettings(
                              name: Routes.addIncomeExpenseScreen),
                          screen: const AddExpenseScreen(),
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: context.theme.textTheme.titleMedium!.color,
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
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColor.orangeAccentColor,
                        boxShadow: [commonBoxshdow()],
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(children: [
                      TextWidget(
                        "Total monthly expenses",
                        fontSize: 13.sp,
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      Obx(
                        () => TextWidget(
                          "\$ ${editYourBudgetController.totalExpenseValue}",
                          fontSize: 13.sp,
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              TextWidget(
                "Balance left over",
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
                    "Monthly balance",
                    fontSize: 13.sp,
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  Obx(
                    () => TextWidget(
                      "\$ ${editYourBudgetController.totalIncomeValue.value - editYourBudgetController.totalExpenseValue.value}",
                      fontSize: 13.sp,
                      color: context.theme.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
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
          hintText: accountController.accountsItems[asoAccount] ?? '',
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
          hintText: accountController.accountsItems[asoAccount] ?? '',
          isCommonContainer: true,
        ),
      ]),
    );
  }
}
