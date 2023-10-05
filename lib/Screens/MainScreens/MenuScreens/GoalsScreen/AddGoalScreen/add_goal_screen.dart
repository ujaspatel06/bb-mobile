// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:budget_buddie/Data/Models/goals_model.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/account_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/GoalsScreen/AddGoalScreen/add_goal_controller.dart';
import 'package:budget_buddie/Utils/Utils.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_chip.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/common_progreebar.dart';
import 'package:budget_buddie/Utils/Widgets/common_progress_bar.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/delete_confirm_dialog.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Utils/Widgets/common_bottom_sheet.dart';

class AddGoalScreen extends StatefulWidget {
  const AddGoalScreen({super.key, this.goalItem});

  final Goals? goalItem;

  @override
  State<AddGoalScreen> createState() => _AddGoalScreenState();
}

class _AddGoalScreenState extends State<AddGoalScreen> {
  AddGoalController addGoalController = Get.put(AddGoalController());
  AccountController accountController = Get.find();

  ImagePicker picker = ImagePicker();
  Goals? goals;

  @override
  void initState() {
    goals = widget.goalItem;
    valueAssign();
    super.initState();
  }

  valueAssign() {
    if (goals != null) {
      addGoalController.nameGoalController.text = goals?.goalName ?? '';
      addGoalController.goalDollarValueController.text =
          (goals?.value ?? 0).toString();
      addGoalController.contributionController.text =
          (goals?.contribution ?? 0).toString();
      addGoalController.howOftenSelectedVal.value = goals?.howOften ?? '';
      addGoalController.accountsSelectedItems.value =
          (goals?.accountUuid ?? 0).toString();
      addGoalController.personalisedEmojiController.text = goals?.icon ?? '';
      addGoalController.pickSelectedColorName.value = goals?.colour ?? '';
    }
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<AddGoalController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: context.theme.textTheme.titleMedium!.color,
              )),
          const SizedBox(),
        ],
        titleWidget: TextWidget(
          goals != null ? "Goal details" : "Add a goal",
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
            key: addGoalController.addGoalFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (goals != null) ...[
                  _commonGoalsCard(),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
                if (goals != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        "Edit Goal",
                        fontSize: 16.sp,
                        color: context.theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w600,
                      ),
                      Obx(
                        () => CustomButton(
                          height: 30,
                          width: 20,
                          isShadow: false,
                          widget: addGoalController.isLoading.value
                              ? const CommonCircularProgressBar()
                              : null,
                          buttonText: "Update",
                          onBtnPress: () {
                            addGoalController.updateGoal(
                                context, goals!.goalUuid!.toString());
                          },
                          backgroundColor:
                              SaprateLightDarkColor.greenLightColor,
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  TextWidget(
                    "New goal",
                    fontSize: 16.sp,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontWeight: FontWeight.w600,
                  ),
                ],
                SizedBox(
                  height: 1.h,
                ),
                CommonFormField(
                  context: context,
                  label: 'Name',
                  controller: addGoalController.nameGoalController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return ErrorMsg.ENTER_NAME;
                    }
                    return null;
                  },
                  flex1: 1,
                  flex2: 3,
                ),
                CommonFormField(
                  context: context,
                  label: 'Goal dollar value',
                  controller: addGoalController.goalDollarValueController,
                  flex1: 2,
                  flex2: 2,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return ErrorMsg.ENTER_VALUE;
                    }
                    return null;
                  },
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
                    CommonFormField(
                      context: context,
                      label: 'Contributions',
                      isCommonContainer: true,
                      controller: addGoalController.contributionController,
                      flex1: 3,
                      flex2: 5,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return ErrorMsg.ENTER_CONTRIBUTION;
                        }
                        return null;
                      },
                    ),
                    CommonFormField(
                      context: context,
                      label: 'How often?',
                      isCommonContainer: true,
                      isDropDown: true,
                      selectedItem: addGoalController.howOftenSelectedVal,
                      dropDownItems: addGoalController.howOftenItems,
                      // controller: grocerieBudgetController.tempController,
                      flex1: 1,
                      flex2: 2,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 1.h,
                ),
                CommonFormField(
                  context: context,
                  label: 'Account',
                  flex1: 1,
                  flex2: 2,
                  isDropDown: true,
                  selectedItem: addGoalController.accountsSelectedItems,
                  dropDownItems: accountController.accountsItems,
                  validator: (v) {
                    if (addGoalController.accountsSelectedItems.isEmpty) {
                      return ErrorMsg.ENTER_ACCOUNT;
                    }
                    return null;
                  },
                  suffixIcon: Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: context.theme.canvasColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(AssetIcons.appIcon))
                      .marginOnly(left: 12),
                ),
                CommonFormField(
                  context: context,
                  label: 'Reference',
                  readOnly: true,
                  hintText: "Goal 5",
                  controller: addGoalController.referenceController,
                  // validator: (v) {
                  //   if (v!.isEmpty) {
                  //     return ErrorMsg.ENTER_REFERENCE;
                  //   }
                  //   return null;
                  // },
                  stacIcon: InkWell(
                    onTap: () async {
                      await Clipboard.setData(
                          const ClipboardData(text: "Goal 5"));
                      Fluttertoast.showToast(
                          msg: "Copied",
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 15);
                    },
                    child: SvgPicture.asset(
                      AssetSvgs.copyIcon,
                      height: 23,
                      color: AppColor.greyColor,
                    ).marginOnly(top: 8, right: 8),
                  ),
                  flex1: 2,
                  flex2: 2,
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
                                      i < pickColorItemList.length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        // addGoalController
                                        //         .pickSelectedColor.value =
                                        //     addGoalController
                                        //         .pickColorItemList.keys
                                        //         .elementAt(i);
                                        addGoalController
                                                .pickSelectedColorName.value =
                                            pickColorItemList.keys.elementAt(i);
                                        Get.back();
                                      },
                                      child: Chip(
                                        // visualDensity: VisualDensity(
                                        //     vertical: -2, horizontal: -2),
                                        label: TextWidget(
                                            pickColorItemList.keys.elementAt(i),
                                            fontSize: 11.sp,
                                            color: AppColor.whiteColor),
                                        backgroundColor: pickColorItemList
                                            .values
                                            .elementAt(i),
                                      ).marginOnly(right: 10),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: FittedBox(
                          alignment: Alignment.centerRight,
                          child: Obx(
                            () => CommonChip(
                                title: addGoalController
                                    .pickSelectedColorName.value,
                                bgColor: pickColorItemList[addGoalController
                                    .pickSelectedColorName.value]),
                          )),
                    ),
                  ),
                  flex1: 2,
                  flex2: 1,
                ),
                Obx(
                  () => CommonFormField(
                    context: context,
                    onTap: pickImage,
                    validator: (v) {
                      if (addGoalController.imagePath.value.isEmpty) {
                        return ErrorMsg.ENTER_IMAGE;
                      }
                      return null;
                    },
                    fileImage: addGoalController.imagePath.value.isEmpty
                        ? const SizedBox()
                        : Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(addGoalController.imagePath.value),
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
                if (goals != null) ...[
                  Obx(
                    () => CustomButton(
                      width: 60,
                      isShadow: false,
                      widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: TextWidget(
                              "Remove goal",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColor.whiteColor,
                            )),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: addGoalController.isLoading.value
                                  ? const CommonCircularProgressBar()
                                  : const Icon(
                                      Icons.close,
                                      color: AppColor.whiteColor,
                                    ),
                            )
                          ]),
                      buttonText: "",
                      onBtnPress: () async {
                        await deleteDialog(context, "Remove",
                            "Are you sure you want to remove this item",
                            () async {
                          await addGoalController.deleteGoal(
                              context, goals!.goalUuid!.toString());
                        });
                      },
                      backgroundColor: AppColor.redColor,
                    ),
                  ),
                ] else ...[
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, bottom: 10, top: 10, right: 10),
                    decoration: BoxDecoration(
                        color: SaprateLightDarkColor.greenLightColor,
                        boxShadow: [commonBoxshdow()],
                        borderRadius: BorderRadius.circular(12)),
                    child: Obx(
                      () => InkWell(
                        onTap: () {
                          addGoalController.addGoal(context);
                        },
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          TextWidget(
                            "Add Goal",
                            fontSize: 12.sp,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: addGoalController.isLoading.value
                                ? const CommonCircularProgressBar()
                                : const Icon(
                                    Icons.add,
                                    size: 25,
                                    color: AppColor.whiteColor,
                                  ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'TIP: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  context.theme.textTheme.titleMedium!.color),
                        ),
                        TextSpan(
                            style: TextStyle(
                                color: context
                                    .theme.textTheme.titleMedium!.color!),
                            text:
                                ' Create separate bank accounts for each goal to keep on track of your progress.\n\nOr if you have one account for multiple goals, use the reference provided above in your transfers and well keep track of your progress for you.'),
                      ],
                    ),
                  ),
                ],
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _commonGoalsCard() {
    Color itemColor = pickColorItemList[widget.goalItem?.colour] ??
        pickColorItemList.values.first;
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [commonBoxshdow(blurRadius: 30)],
          color: itemColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                width: 4.w,
              ),
              TextWidget(goals?.goalName ?? "",
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                  fontSize: 13.sp),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              TextWidget(
                "Balance",
                fontSize: 9.sp,
                color: context.theme.primaryColor,
                fontWeight: FontWeight.w400,
              ),
              const Spacer(),
              TextWidget(
                "50%",
                fontSize: 9.sp,
                color: context.theme.primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          CommonLinerProgressBar(
            maxValue: 100,
            size: 6,
            borderRadius: BorderRadius.circular(50),
            progressColor: colorToDarkColor(itemColor, 0.2),
            backgroundColor: AppColor.whiteColor.withOpacity(0.4),
            currentValue: 45,
            direction: Axis.horizontal,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              TextWidget(
                "\$300 ",
                fontSize: 14.sp,
                color: context.theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
              TextWidget(
                " of \$699",
                fontSize: 10.sp,
                color: context.theme.primaryColor,
                fontWeight: FontWeight.w400,
              ),
              const Spacer(),
              TextWidget(
                "12th December 2022",
                fontSize: 10.sp,
                color: context.theme.primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  pickImage() async {
    try {
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        addGoalController.imagePath.value = pickedImage.path;
        addGoalController.imageName.value = pickedImage.name;
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    }
  }
}
