import 'dart:io';

import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/EditYourGoalBudgetScreen/edit_your_goal_budget_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/common_chip.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/common_progreebar.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Utils.dart';

class EditYourGoalBudgetScreen extends StatefulWidget {
  const EditYourGoalBudgetScreen({super.key});

  @override
  State<EditYourGoalBudgetScreen> createState() =>
      _EditYourGoalBudgetScreenState();
}

class _EditYourGoalBudgetScreenState extends State<EditYourGoalBudgetScreen> {
  EditYourGoalBudgetController editYourGoalBudgetController =
      Get.put(EditYourGoalBudgetController());

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
          "Edit your goal budget",
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
            key: editYourGoalBudgetController.editGoalBudgetKey,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      boxShadow: [commonBoxshdow()],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              "Goal name",
                              fontSize: 14.sp,
                              color: context.theme.textTheme.titleMedium!.color,
                              fontWeight: FontWeight.w600,
                            ),
                            TextWidget(
                              "Goal 1 - Holiday",
                              fontSize: 14.sp,
                              color: context.theme.textTheme.titleMedium!.color,
                              fontWeight: FontWeight.w600,
                            ),
                          ]),
                    ),
                    CommonFormField(
                      context: context,
                      label: 'Goal budget amount',
                      controller:
                          editYourGoalBudgetController.goalAmountController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return ErrorMsg.ENTER_AMOUNT;
                        }
                        return null;
                      },
                      textInputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9-]")),
                      ],
                      isCommonContainer: true,
                      flex1: 3,
                      flex2: 5,
                    ),
                    CommonFormField(
                      context: context,
                      controller:
                          editYourGoalBudgetController.startDateController,
                      stacIcon: IconButton(
                        constraints:
                            const BoxConstraints(maxHeight: 35, minHeight: 35),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: context.theme.hintColor,
                                      onPrimary: context.theme.primaryColor,
                                      onSurface: context
                                          .theme.textTheme.titleMedium!.color!,
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                          foregroundColor: context.theme
                                              .textTheme.titleMedium!.color!),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                              context: context,
                              initialDate: editYourGoalBudgetController
                                      .startDateController.text.isEmpty
                                  ? DateTime.now()
                                  : parseCustomFormat(
                                      editYourGoalBudgetController
                                          .startDateController.text),

                              //get today's date
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('MM-dd-yyyy').format(pickedDate);

                            editYourGoalBudgetController
                                .startDateController.text = formattedDate;
                          } else {
                            debugPrint("Date is not selected");
                          }
                        },
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: context.theme.textTheme.titleMedium!.color,
                        ),
                      ),
                      label: 'Start date',
                      isCommonContainer: true,
                      flex1: 1,
                      flex2: 3,
                    ),
                    CommonFormField(
                      controller:
                          editYourGoalBudgetController.endDateController,
                      context: context,
                      stacIcon: IconButton(
                        constraints:
                            const BoxConstraints(maxHeight: 35, minHeight: 35),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: context.theme.hintColor,
                                      onPrimary: context.theme.primaryColor,
                                      onSurface: context
                                          .theme.textTheme.titleMedium!.color!,
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                          foregroundColor: context.theme
                                              .textTheme.titleMedium!.color!),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                              context: context,
                              initialDate: editYourGoalBudgetController
                                      .endDateController.text.isEmpty
                                  ? DateTime.now()
                                  : parseCustomFormat(
                                      editYourGoalBudgetController
                                          .endDateController.text),

                              //get today's date
                              firstDate: DateTime(2000),
                              lastDate: DateTime(3000));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('MM-dd-yyyy').format(pickedDate);

                            editYourGoalBudgetController
                                .endDateController.text = formattedDate;
                          } else {
                            debugPrint("Date is not selected");
                          }
                        },
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: context.theme.textTheme.titleMedium!.color,
                        ),
                      ),
                      label: 'End date',
                      isCommonContainer: true,
                      flex1: 1,
                      flex2: 3,
                    ),
                    CommonFormField(
                      context: context,
                      isCommonContainer: true,
                      label: 'Account associated',
                      controller:
                          editYourGoalBudgetController.accountAssController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return ErrorMsg.ENTER_AMOUNT;
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9-]")),
                      ],
                      flex1: 3,
                      flex2: 5,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'TIP: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: context.theme.textTheme.titleMedium!.color),
                      ),
                      TextSpan(
                          style: TextStyle(
                              color: context.theme.textTheme.titleMedium!.color!
                                  .withOpacity(0.7)),
                          text:
                              'For transactions to automatically categorise to your goal, set a start and end date. Or transactions can be categorised manually.'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
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
                                color:
                                    context.theme.textTheme.titleMedium!.color,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Wrap(
                                children: [
                                  for (var i = 0;
                                      i <
                                          editYourGoalBudgetController
                                              .pickColorItemList.length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        editYourGoalBudgetController
                                                .pickSelectedColor.value =
                                            editYourGoalBudgetController
                                                .pickColorItemList.keys
                                                .elementAt(i);
                                        editYourGoalBudgetController
                                                .pickSelectedColorName.value =
                                            editYourGoalBudgetController
                                                .pickColorItemList.values
                                                .elementAt(i);
                                        Get.back();
                                      },
                                      child: Chip(
                                        // visualDensity: VisualDensity(
                                        //     vertical: -2, horizontal: -2),
                                        label: TextWidget(
                                            editYourGoalBudgetController
                                                .pickColorItemList.values
                                                .elementAt(i),
                                            fontSize: 11.sp,
                                            color: AppColor.whiteColor),
                                        backgroundColor:
                                            editYourGoalBudgetController
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
                                title: editYourGoalBudgetController
                                    .pickSelectedColorName.value,
                                bgColor: editYourGoalBudgetController
                                    .pickSelectedColor.value)),
                      ),
                    ),
                  ),
                  flex1: 4,
                  flex2: 3,
                ),
                CommonFormField(
                  context: context,
                  onTap: pickImage,
                  controller: editYourGoalBudgetController.emojiController,
                  fileImage: editYourGoalBudgetController.imagePath.isEmpty
                      ? const SizedBox()
                      : Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(editYourGoalBudgetController
                                      .imagePath.value),
                                ),
                              )),
                        ),
                  label: 'Personalised Emoji',
                  readOnly: true,
                  flex1: 2,
                  flex2: 1,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextWidget(
                  "Achieved Goal Budget",
                  fontSize: 16.sp,
                  color: context.theme.textTheme.titleMedium!.color,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.orangeAccentColor,
                      boxShadow: [commonBoxshdow(blurRadius: 3)],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget("Goal 1 - Holiday",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.whiteColor),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget("\$1000",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColor.whiteColor),
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
                                color: AppColor.whiteColor),
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
                          backgroundColor: AppColor.whiteColor.withOpacity(0.4),
                          currentValue: 80,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickImage() async {
    try {
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        editYourGoalBudgetController.imagePath.value = pickedImage.path;
        editYourGoalBudgetController.imageName.value = pickedImage.name;
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    }
  }
}
