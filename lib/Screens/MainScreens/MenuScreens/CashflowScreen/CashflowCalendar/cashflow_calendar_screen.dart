// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/AccountDetailScreen/account_detail_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/account_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/CashflowScreen/CashflowCalendar/cashflow_calendar_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NotificationScreen/notification_screen.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_avatar_chip.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/generated/assets.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class CashflowCalendarScreen extends StatefulWidget {
  const CashflowCalendarScreen({super.key});

  @override
  State<CashflowCalendarScreen> createState() => _CashflowCalendarScreenState();
}

class _CashflowCalendarScreenState extends State<CashflowCalendarScreen> {
  CashflowCalendarController cashflowCalendarController =
      Get.put(CashflowCalendarController());
  AccountController accountController = Get.find();

  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2023, 8, 1): ['Event 1', 'Event 2'],
    DateTime.utc(2023, 8, 3): ['Event 1'],
    DateTime.utc(2023, 8, 13): ['Event 1'],
    DateTime.utc(2023, 8, 21): ['Event 1'],
    DateTime.utc(2023, 8, 28): ['Event 1', 'Event 2'],
    DateTime.utc(2023, 8, 31): ['Event 1'],
  };

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
          "Cashflow Calendar",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Form(
            key: cashflowCalendarController.cashflowCalenderKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // padding: const EdgeInsets.all(15),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: context.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [commonBoxshdow()],
                  ),
                  child: TableCalendar(
                    daysOfWeekHeight: 60,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 24),
                    focusedDay: cashflowCalendarController.focusedDay,
                    eventLoader: (day) {
                      // print(day);
                      if (_events.keys.contains(day)) {
                        return _events[day] ?? [];
                      }
                      return [];
                    },

                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (BuildContext context, date, events) {
                        if (events.isEmpty) return const SizedBox();

                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(top: 22),
                                padding: const EdgeInsets.all(1),
                                child: Container(
                                  width: 6,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == 0
                                          ? box.read(GetStorageKey.themeMode) ??
                                                  false
                                              ? SaprateLightDarkColor.cyanColor
                                              : SaprateLightDarkColor
                                                  .greenLightColor
                                          : AppColor.redDarkColor),
                                ),
                              );
                            });
                      },
                    ),

                    selectedDayPredicate: (day) =>
                        isSameDay(cashflowCalendarController.selectedDay, day),
                    calendarStyle: CalendarStyle(
                      tablePadding: const EdgeInsets.symmetric(horizontal: 15),
                      markerSize: 5.0,
                      markerDecoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      todayDecoration: BoxDecoration(
                          color: context.theme.cardColor,
                          shape: BoxShape.circle),
                      // selectedTextStyle:
                      //     TextStyle(color: context.theme.primaryColor),

                      todayTextStyle:
                          TextStyle(color: context.theme.primaryColor),
                      selectedDecoration: const BoxDecoration(
                          color: AppColor.calendarDarkGreenColor,
                          shape: BoxShape.circle),
                      weekendTextStyle: const TextStyle(
                          color: AppColor.redColor,
                          fontWeight: FontWeight.w600),
                      defaultTextStyle: TextStyle(
                          color: context.theme.textTheme.titleMedium!.color),
                    ),

                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: context.theme.textTheme.titleMedium!.color),
                      weekendStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: context.theme.textTheme.titleMedium!.color),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                            color: AppColor.greyColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    headerStyle: HeaderStyle(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                            image: DecorationImage(
                                image: AssetImage(
                                    box.read(GetStorageKey.themeMode) ?? false
                                        ? Assets.pngsCalenderUpperBgDark
                                        : Assets.pngsCalenderUpperBg),
                                fit: BoxFit.cover)),
                        // headerPadding: const EdgeInsets.only(bottom: 15),
                        formatButtonVisible: false,
                        leftChevronIcon: const Icon(
                          Icons.chevron_left,
                          color: AppColor.whiteColor,
                        ),
                        rightChevronIcon: const Icon(
                          Icons.chevron_right,
                          color: AppColor.whiteColor,
                        ),
                        titleTextStyle: const TextStyle(
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 18)),
                    calendarFormat: cashflowCalendarController.calendarFormat,
                    rangeSelectionMode:
                        cashflowCalendarController.rangeSelectionMode,
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(cashflowCalendarController.selectedDay,
                          selectedDay)) {
                        setState(() {
                          cashflowCalendarController.selectedDay = selectedDay;
                          cashflowCalendarController.focusedDay = focusedDay;

                          cashflowCalendarController.rangeSelectionMode =
                              RangeSelectionMode.toggledOff;
                        });
                      }
                    },
                    // onRangeSelected: (start, end, focusedDay) {
                    //   setState(() {
                    //     _selectedDay = null;
                    //     _focusedDay = focusedDay;
                    //
                    //     _rangeSelectionMode = RangeSelectionMode.toggledOn;
                    //   });
                    // },
                    onFormatChanged: (format) {
                      if (cashflowCalendarController.calendarFormat != format) {
                        setState(() {
                          cashflowCalendarController.calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      setState(() {
                        cashflowCalendarController.focusedDay = focusedDay;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: context.theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [commonBoxshdow()],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: SaprateLightDarkColor.greenLightColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: TextWidget(
                                "1",
                                color: AppColor.whiteColor,
                                textAlign: TextAlign.center,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextWidget(
                            "Pay & Rental Income",
                            color: context.theme.textTheme.titleMedium!.color,
                            textAlign: TextAlign.center,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: context.theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [commonBoxshdow(blurRadius: 30)],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: AppColor.redDarkColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: TextWidget(
                                "2",
                                color: AppColor.whiteColor,
                                textAlign: TextAlign.center,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextWidget(
                            "Food, Mortgage & Car",
                            color: context.theme.textTheme.titleMedium!.color,
                            textAlign: TextAlign.center,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  "Add Income",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: context.theme.textTheme.titleMedium!.color,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      right: 10, top: 5, bottom: 5, left: 5),
                  decoration: ShapeDecoration(
                    color: context.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [commonBoxshdow()],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: CommonFormField(
                              context: context,
                              isCommonContainer: true,
                              hintText: "Name",
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return ErrorMsg.ENTER_NAME;
                                }
                                return null;
                              },
                              controller: cashflowCalendarController
                                  .incomeNameController,
                              horizontalPadding: 3,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: CommonFormField(
                              context: context,
                              isCommonContainer: true,
                              textInputType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[0-9-]")),
                              ],
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return ErrorMsg.ENTER_AMOUNT;
                                }
                                return null;
                              },
                              controller: cashflowCalendarController
                                  .incomeAmountController,
                              hintText: "Amount",
                              horizontalPadding: 3,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: CommonFormField(
                              context: context,
                              isCommonContainer: true,
                              isDropDown: true,
                              selectedItem:
                                  cashflowCalendarController.tempSelectedValue,
                              dropDownItems:
                                  cashflowCalendarController.tempItems,
                              horizontalPadding: 3,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: CommonFormField(
                              context: context,
                              isCommonContainer: true,
                              isDropDown: true,
                              selectedItem:
                                  cashflowCalendarController.tempSelectedValue,
                              dropDownItems:
                                  cashflowCalendarController.tempItems,
                              horizontalPadding: 3,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 6),
                            padding: const EdgeInsets.all(6),
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: box.read(GetStorageKey.themeMode) ?? false
                                  ? SaprateLightDarkColor.cyanColor
                                  : SaprateLightDarkColor.greenLightColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: AppColor.whiteColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  "Add Expense",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: context.theme.textTheme.titleMedium!.color,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      right: 10, top: 5, bottom: 5, left: 5),
                  decoration: ShapeDecoration(
                    color: context.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [commonBoxshdow()],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: CommonFormField(
                              context: context,
                              isCommonContainer: true,
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return ErrorMsg.ENTER_NAME;
                                }
                                return null;
                              },
                              controller: cashflowCalendarController
                                  .expenseNameController,
                              hintText: "Name",
                              horizontalPadding: 3,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: CommonFormField(
                              context: context,
                              isCommonContainer: true,
                              textInputType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[0-9-]")),
                              ],
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return ErrorMsg.ENTER_AMOUNT;
                                }
                                return null;
                              },
                              controller: cashflowCalendarController
                                  .expenseAmountController,
                              hintText: "Amount",
                              horizontalPadding: 3,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: CommonFormField(
                              context: context,
                              isCommonContainer: true,
                              isDropDown: true,
                              selectedItem:
                                  cashflowCalendarController.tempSelectedValue,
                              dropDownItems:
                                  cashflowCalendarController.tempItems,
                              horizontalPadding: 3,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: CommonFormField(
                              context: context,
                              isCommonContainer: true,
                              isDropDown: true,
                              selectedItem:
                                  cashflowCalendarController.tempSelectedValue,
                              dropDownItems:
                                  cashflowCalendarController.tempItems,
                              horizontalPadding: 3,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 6),
                            padding: const EdgeInsets.all(6),
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: AppColor.redDarkColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: AppColor.whiteColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextWidget(
                  "Transactions",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: context.theme.textTheme.titleMedium!.color,
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
                                  TextWidget("Contact Energy",
                                      maxLine: 1,
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w600,
                                      color: context
                                          .theme.textTheme.titleMedium!.color,
                                      fontSize: 12.sp),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const FittedBox(
                                      child: CommonAvatarChip(
                                    title: "Health",
                                    avatar: '👌🏻',
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextWidget("-\$120.00",
                                fontWeight: FontWeight.w600,
                                color: AppColor.redColor,
                                fontSize: 12.sp),
                          ],
                        ),
                      );
                    }),
                const SizedBox(
                  height: 30,
                ),
                TextWidget(
                  "Projected account balances",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: context.theme.textTheme.titleMedium!.color,
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: accountController.accountList.length,
                      itemBuilder: (context, index) {
                        var accountListValue =
                            accountController.accountList[index];
                        return InkWell(
                          onTap: () {
                            PersistentNavBarNavigator
                                .pushNewScreenWithRouteSettings(
                              context,
                              settings: const RouteSettings(
                                  name: Routes.accountDetailScreen),
                              screen: AccountDetailScreen(
                                accounts: accountListValue,
                                routesName: Routes.cashflowCalendarScreen,
                              ),
                              pageTransitionAnimation:
                                  PageTransitionAnimation.fade,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 7),
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
                                  height: 42,
                                  width: 42,
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
                                  width: 5.w,
                                ),
                                Expanded(
                                  child: TextWidget(
                                      accountListValue.accountName!,
                                      maxLine: 1,
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w600,
                                      color: context
                                          .theme.textTheme.titleMedium!.color,
                                      fontSize: 13.sp),
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
                        );
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
