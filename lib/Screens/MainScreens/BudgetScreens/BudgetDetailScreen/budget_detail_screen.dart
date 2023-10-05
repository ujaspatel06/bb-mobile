import 'dart:io';

import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/BudgetDetailScreen/budget_detail_controller.dart';
import 'package:budget_buddie/Utils/Utils.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/common_progreebar.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/common_bottom_sheet.dart';
import '../../../../Utils/Widgets/common_chip.dart';

class BudgetDetailScreen extends StatefulWidget {
  const BudgetDetailScreen({super.key, this.budgetDetailName});

  final String? budgetDetailName;

  @override
  State<BudgetDetailScreen> createState() => _BudgetDetailScreenState();
}

class _BudgetDetailScreenState extends State<BudgetDetailScreen> {
  BudgetDetailController budgetDetailController =
      Get.put(BudgetDetailController());

  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: context.theme.textTheme.titleLarge!.color,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        titleWidget: TextWidget(
          "${widget.budgetDetailName} budget",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: budgetDetailController.budgetDetailKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      "Edit expense",
                      fontSize: 16.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          boxShadow: [commonBoxshdow()],
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(children: [
                        CommonFormField(
                          context: context,
                          label: 'Food',
                          isCommonContainer: true,
                          controller: budgetDetailController.nameController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return ErrorMsg.REQUIRED;
                            }
                            return null;
                          },
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9-]")),
                          ],
                          flex1: 3,
                          flex2: 5,
                        ),
                        CommonFormField(
                          context: context,
                          label: 'How often?',
                          isCommonContainer: true,
                          isDropDown: true,
                          selectedItem:
                              budgetDetailController.howOftenSelectedVal,
                          dropDownItems: budgetDetailController.howOftenItems,
                          flex1: 1,
                          flex2: 2,
                        ),
                        CommonFormField(
                          context: context,
                          isCommonContainer: true,
                          label: 'Last pay day date',
                          stacIcon: IconButton(
                            constraints: const BoxConstraints(
                                maxHeight: 35, minHeight: 35),
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: context.theme.hintColor,
                                          onPrimary: context.theme.primaryColor,
                                          onSurface: context.theme.textTheme
                                              .titleMedium!.color!,
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                              foregroundColor: context
                                                  .theme
                                                  .textTheme
                                                  .titleMedium!
                                                  .color!),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  context: context,
                                  initialDate: budgetDetailController
                                          .lastPayDateController.text.isEmpty
                                      ? DateTime.now()
                                      : parseCustomFormat(budgetDetailController
                                          .lastPayDateController.text),

                                  //get today's date
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000));

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('MM-dd-yyyy').format(pickedDate);

                                budgetDetailController
                                    .lastPayDateController.text = formattedDate;
                              } else {
                                debugPrint("Date is not selected");
                              }
                            },
                            icon: Icon(
                              Icons.calendar_month_rounded,
                              color: context.theme.textTheme.titleMedium!.color,
                            ),
                          ),
                          controller:
                              budgetDetailController.lastPayDateController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return ErrorMsg.SELECT_DATE;
                            }
                            return null;
                          },
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextWidget(
                      "Personalise",
                      fontSize: 16.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CommonFormField(
                      context: context,
                      label: 'Personalised colour',
                      controller: budgetDetailController.emojiController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return ErrorMsg.REQUIRED;
                        }
                        return null;
                      },
                      onlyStackIcon: Container(
                        height: 40,
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {
                            commonModalSheet(
                              context,
                              title: "Pick your colour",
                              heigth: 2.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    "Colour",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: context
                                        .theme.textTheme.titleMedium!.color,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                    children: [
                                      for (var i = 0;
                                          i <
                                              budgetDetailController
                                                  .pickColorItemList.length;
                                          i++)
                                        GestureDetector(
                                          onTap: () {
                                            budgetDetailController
                                                    .pickSelectedColor.value =
                                                budgetDetailController
                                                    .pickColorItemList.keys
                                                    .elementAt(i);
                                            budgetDetailController
                                                    .pickSelectedColorName
                                                    .value =
                                                budgetDetailController
                                                    .pickColorItemList.values
                                                    .elementAt(i);
                                            Get.back();
                                          },
                                          child: Chip(
                                            // visualDensity: VisualDensity(
                                            //     vertical: -2, horizontal: -2),
                                            label: TextWidget(
                                                budgetDetailController
                                                    .pickColorItemList.values
                                                    .elementAt(i),
                                                fontSize: 11.sp,
                                                color: AppColor.whiteColor),
                                            backgroundColor:
                                                budgetDetailController
                                                    .pickColorItemList.keys
                                                    .elementAt(i),
                                          ).marginOnly(right: 10),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Obx(
                            () => FittedBox(
                                alignment: Alignment.centerRight,
                                child: CommonChip(
                                    title: budgetDetailController
                                        .pickSelectedColorName.value,
                                    bgColor: budgetDetailController
                                        .pickSelectedColor.value)),
                          ),
                        ),
                      ),
                      flex1: 4,
                      flex2: 3,
                    ),
                    Obx(
                      () => CommonFormField(
                        context: context,
                        onTap: pickImage,
                        fileImage: budgetDetailController.imagePath.isEmpty
                            ? const SizedBox()
                            : Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                        File(budgetDetailController
                                            .imagePath.value),
                                      ),
                                    )),
                              ),
                        label: 'Personalised Emoji',
                        readOnly: true,
                        flex1: 2,
                        flex2: 1,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          "Spend vs budget",
                          fontSize: 16.sp,
                          color: context.theme.textTheme.titleMedium!.color,
                          fontWeight: FontWeight.w500,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            commonModalSheet(
                              context,
                              title: "Date range",
                              heigth: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    "Periods",
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
                                                budgetDetailController
                                                    .dateRangeItem.length;
                                            i++)
                                          GestureDetector(
                                            onTap: () {
                                              budgetDetailController
                                                      .incomeBudgetSelectedItem
                                                      .value =
                                                  budgetDetailController
                                                      .dateRangeItem[i];
                                              Get.back();
                                            },
                                            child: Chip(
                                              visualDensity:
                                                  const VisualDensity(
                                                      vertical: -3,
                                                      horizontal: 0),
                                              label: TextWidget(
                                                  budgetDetailController
                                                      .dateRangeItem[i],
                                                  fontSize: 10.sp,
                                                  color: budgetDetailController
                                                              .incomeBudgetSelectedItem
                                                              .value ==
                                                          budgetDetailController
                                                              .dateRangeItem[i]
                                                      ? AppColor.whiteColor
                                                      : context.theme.textTheme
                                                          .titleMedium!.color),
                                              backgroundColor:
                                                  budgetDetailController
                                                              .incomeBudgetSelectedItem
                                                              .value ==
                                                          budgetDetailController
                                                              .dateRangeItem[i]
                                                      ? SaprateLightDarkColor
                                                          .greenLightColor
                                                      : context
                                                          .theme.primaryColor,
                                              side: BorderSide(
                                                  color: budgetDetailController
                                                              .incomeBudgetSelectedItem
                                                              .value ==
                                                          budgetDetailController
                                                              .dateRangeItem[i]
                                                      ? context
                                                          .theme.primaryColor
                                                      : AppColor.greyColor),
                                            ).marginOnly(right: 10, bottom: 5),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Obx(
                            () => CommonChip(
                                title: budgetDetailController
                                    .incomeBudgetSelectedItem.value),
                          ),
                        ),
                        // Obx(
                        //   () => CustomDropdownButtonWithList(
                        //     dropDownList: budgetDetailController.tempItemsList,
                        //     onChanged: (String? value) {
                        //       budgetDetailController.tempSelectedValue2.value =
                        //           value!;
                        //     },
                        //     value: budgetDetailController.tempSelectedValue2.value,
                        //     hint: '',
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(Routes.grocerieBudgetScreen,
                        //     id: NestedKeys.dashBoardId);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: context.theme.primaryColor,
                            boxShadow: [commonBoxshdow()],
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        "Groceries",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextWidget("\$699",
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                          color: context.theme.textTheme
                                              .titleMedium!.color),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextWidget("\$10 left",
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                      color: context
                                          .theme.textTheme.titleMedium!.color),
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),

                              // LinearProgressIndicator()

                              CommonLinerProgressBar(
                                maxValue: 100,
                                size: 8,
                                borderRadius: BorderRadius.circular(50),
                                progressColor: AppColor.brownDarkColor,
                                backgroundColor:
                                    AppColor.brownDarkColor.withOpacity(0.2),
                                currentValue: 80,
                                direction: Axis.horizontal,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextWidget(
                      "Transactions",
                      fontSize: 16.sp,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
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
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget("Countdown",
                                              fontWeight: FontWeight.w600,
                                              color: context.theme.textTheme
                                                  .titleMedium!.color,
                                              textAlign: TextAlign.start,
                                              maxLine: 1,
                                              fontSize: 13.sp),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextWidget("Groceries - Today",
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.greyColor,
                                              fontSize: 10.sp),
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
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          "Spend vs budget",
                          fontSize: 16.sp,
                          color: context.theme.textTheme.titleMedium!.color,
                          fontWeight: FontWeight.w500,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            commonModalSheet(
                              context,
                              title: "Date range",
                              heigth: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    "Periods",
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
                                                budgetDetailController
                                                    .dateRangeGraphItem.length;
                                            i++)
                                          GestureDetector(
                                            onTap: () {
                                              budgetDetailController
                                                      .incomeBudgetGraphSelectedItem
                                                      .value =
                                                  budgetDetailController
                                                      .dateRangeGraphItem[i];
                                              Get.back();
                                            },
                                            child: Chip(
                                              visualDensity:
                                                  const VisualDensity(
                                                      vertical: -3,
                                                      horizontal: 0),
                                              label: TextWidget(
                                                  budgetDetailController
                                                      .dateRangeGraphItem[i],
                                                  fontSize: 10.sp,
                                                  color: budgetDetailController
                                                              .incomeBudgetGraphSelectedItem
                                                              .value ==
                                                          budgetDetailController
                                                                  .dateRangeGraphItem[
                                                              i]
                                                      ? AppColor.whiteColor
                                                      : context.theme.textTheme
                                                          .titleMedium!.color),
                                              backgroundColor: budgetDetailController
                                                          .incomeBudgetGraphSelectedItem
                                                          .value ==
                                                      budgetDetailController
                                                          .dateRangeGraphItem[i]
                                                  ? SaprateLightDarkColor
                                                      .greenLightColor
                                                  : context.theme.primaryColor,
                                              side: BorderSide(
                                                  color: budgetDetailController
                                                              .incomeBudgetGraphSelectedItem
                                                              .value ==
                                                          budgetDetailController
                                                              .dateRangeGraphItem[i]
                                                      ? context.theme.primaryColor
                                                      : AppColor.greyColor),
                                            ).marginOnly(right: 10, bottom: 5),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Obx(
                            () => CommonChip(
                                title: budgetDetailController
                                    .incomeBudgetGraphSelectedItem.value),
                          ),
                        ),
                        // Obx(
                        //   () => CustomDropdownButtonWithList(
                        //     dropDownList: budgetDetailController.tempItemsList,
                        //     onChanged: (String? value) {
                        //       budgetDetailController.tempSelectedValue2.value =
                        //           value!;
                        //     },
                        //     value: budgetDetailController.tempSelectedValue2.value,
                        //     hint: '',
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      // height: 200,
                      decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [commonBoxshdow(blurRadius: 20)]),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              "Week 1: 9/01/2023",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: context.theme.textTheme.titleMedium!.color,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                TextWidget(
                                  "Budget: ",
                                  fontSize: 12.sp,
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontWeight: FontWeight.w600,
                                ),
                                TextWidget(
                                  "\$1890",
                                  fontSize: 14.sp,
                                  color: box.read(GetStorageKey.themeMode) ??
                                          false
                                      ? SaprateLightDarkColor.cyanColor
                                      : SaprateLightDarkColor.greenLightColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                const Spacer(),
                                TextWidget(
                                  "Spend: ",
                                  fontSize: 12.sp,
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontWeight: FontWeight.w600,
                                ),
                                TextWidget(
                                  "\$1890",
                                  fontSize: 14.sp,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            SizedBox(
                              height: 200,
                              child: BarChart(
                                BarChartData(
                                  barTouchData: BarTouchData(
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.transparent,
                                      // getTooltipItem: (group, groupIndex, rod, rodIndex) {
                                      //   return BarTooltipItem(
                                      //       "", const TextStyle(color: Colors.black));
                                      // },
                                      tooltipMargin: 0,
                                    ),
                                    touchCallback:
                                        (FlTouchEvent event, barTouchResponse) {
                                      if (!event.isInterestedForInteractions ||
                                          barTouchResponse == null ||
                                          barTouchResponse.spot == null) {
                                        setState(() {
                                          budgetDetailController.touchedIndex =
                                              -1;
                                        });
                                        return;
                                      }
                                      final rodIndex = barTouchResponse
                                          .spot!.touchedRodDataIndex;
                                      if (budgetDetailController
                                          .isShadowBar(rodIndex)) {
                                        setState(() {
                                          budgetDetailController.touchedIndex =
                                              -1;
                                        });
                                        return;
                                      }
                                      setState(() {
                                        budgetDetailController.touchedIndex =
                                            barTouchResponse
                                                .spot!.touchedBarGroupIndex;
                                      });
                                    },
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 28,
                                        getTitlesWidget: bottomTitles,
                                      ),
                                    ),
                                    leftTitles: const AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false,
                                        reservedSize: 40,
                                      ),
                                    ),
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                  ),
                                  gridData: const FlGridData(
                                    show: true,
                                    drawHorizontalLine: false,
                                    drawVerticalLine: false,
                                  ),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  groupsSpace: 5,
                                  barGroups:
                                      BudgetDetailController.mainItems.entries
                                          .map(
                                            (e) => budgetDetailController
                                                .generateGroup(
                                              e.key,
                                              e.value[0],
                                              e.value[1],
                                            ),
                                          )
                                          .toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: box.read(GetStorageKey.themeMode) ??
                                            false
                                        ? SaprateLightDarkColor.cyanColor
                                        : SaprateLightDarkColor.greenLightColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                TextWidget(
                                  "Income",
                                  fontSize: 10.sp,
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                TextWidget(
                                  "Expenses",
                                  fontSize: 10.sp,
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: context.theme.textTheme.titleMedium!.color);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '1';
        break;
      case 1:
        text = '2';
        break;
      case 2:
        text = '3';
        break;
      case 3:
        text = '4';
        break;
      case 4:
        text = '5';
        break;
      case 5:
        text = '6';
        break;
      case 6:
        text = '7';
        break;
      case 7:
        text = '8';
        break;
      case 8:
        text = '9';
        break;
      case 9:
        text = '10';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  pickImage() async {
    try {
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        budgetDetailController.imagePath.value = pickedImage.path;
        budgetDetailController.imageName.value = pickedImage.name;
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    }
  }
}
