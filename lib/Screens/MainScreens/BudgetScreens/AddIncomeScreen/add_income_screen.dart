import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/AddIncomeScreen/add_income_expense_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/account_controller.dart';
import 'package:budget_buddie/Utils/Utils.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/delete_confirm_dialog.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/common_progress_bar.dart';
import '../../../../Utils/Widgets/text_widget.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen(
      {super.key,
      this.incomeName,
      this.incomeType,
      this.lastPayDate,
      this.incomeAmount,
      this.howOften,
      this.assoAccount,
      this.isEdit = false,
      this.incomeUuid});
  final bool isEdit;
  final String? incomeUuid;
  final String? incomeName;
  final String? incomeType;
  final String? lastPayDate;
  final String? incomeAmount;
  final String? howOften;
  final String? assoAccount;

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  AddIncomeExpenseController addIncomeExpenseController =
      Get.put(AddIncomeExpenseController());
  AccountController accountController = Get.put(AccountController());

  @override
  void initState() {
    if (widget.isEdit) {
      addIncomeExpenseController.incomeNameController.text =
          widget.incomeName ?? '';
      addIncomeExpenseController.accountsSelectedItems.value =
          widget.assoAccount ?? '';
      addIncomeExpenseController.incomeAmountController.text =
          widget.incomeAmount ?? '';
      addIncomeExpenseController.incomeLastPayDayDate.text =
          widget.lastPayDate ?? '';
      addIncomeExpenseController.howOftenSelectedVal.value =
          widget.howOften ?? '';
      addIncomeExpenseController.incomeTypeSelectedValue.value =
          widget.incomeType ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    addIncomeExpenseController.clearIncomeFields();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          if (widget.isEdit)
            IconButton(
                onPressed: () async {
                  deleteDialog(context, "Delete",
                      "Are you sure you want to delete this item", () async {
                    await addIncomeExpenseController.deleteIncome(
                        context, widget.incomeUuid!);
                  });
                },
                icon: Icon(
                  Icons.delete_outline_rounded,
                  color: context.theme.textTheme.titleMedium!.color,
                )),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: context.theme.textTheme.titleMedium!.color,
              )),
        ],
        titleWidget: TextWidget(
          widget.isEdit ? 'Update Income' : 'Add Income',
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  boxShadow: [commonBoxshdow()],
                  borderRadius: BorderRadius.circular(15)),
              child: Form(
                key: addIncomeExpenseController.addIncomeFormKey,
                child: Column(children: [
                  CommonFormField(
                    context: context,
                    label: 'Income Type',
                    isCommonContainer: true,
                    isDropDown: true,
                    selectedItem:
                        addIncomeExpenseController.incomeTypeSelectedValue,
                    dropDownItems: addIncomeExpenseController.incomeTypeItems,
                    flex2: 2,
                  ),
                  CommonFormField(
                    context: context,
                    label: 'Income Name',
                    isCommonContainer: true,
                    flex2: 3,
                    flex1: 2,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return ErrorMsg.INCOME_NAME;
                      }
                      return null;
                    },
                    controller: addIncomeExpenseController.incomeNameController,
                  ),
                  CommonFormField(
                    context: context,
                    label: 'Last pay day date',
                    readOnly: true,
                    // hintText: addIncomeExpenseController.incomeLastPayDayDate.text,
                    isCommonContainer: true,
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
                                        foregroundColor: context.theme.textTheme
                                            .titleMedium!.color!),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                            context: context,
                            initialDate: addIncomeExpenseController
                                    .incomeLastPayDayDate.text.isEmpty
                                ? DateTime.now()
                                : parseCustomFormat(addIncomeExpenseController
                                    .incomeLastPayDayDate.text),

                            //get today's date
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000));

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('MM-dd-yyyy').format(pickedDate);

                          addIncomeExpenseController.incomeLastPayDayDate.text =
                              formattedDate;
                        } else {
                          debugPrint("Date is not selected");
                        }
                      },
                      icon: Icon(
                        Icons.calendar_month_rounded,
                        color: context.theme.textTheme.titleMedium!.color,
                      ),
                    ),
                    validator: (v) {
                      if (v!.isEmpty) {
                        return ErrorMsg.SELECT_DATE;
                      }
                      return null;
                    },
                    controller: addIncomeExpenseController.incomeLastPayDayDate,
                  ),
                  CommonFormField(
                    context: context,
                    label: 'Income amount',
                    isCommonContainer: true,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9-]")),
                    ],
                    validator: (v) {
                      if (v!.isEmpty) {
                        return ErrorMsg.INCOME_AMOUNT;
                      }
                      return null;
                    },
                    controller:
                        addIncomeExpenseController.incomeAmountController,
                  ),
                  CommonFormField(
                    context: context,
                    label: 'How often?',
                    flex2: 2,
                    isCommonContainer: true,
                    isDropDown: true,
                    selectedItem:
                        addIncomeExpenseController.howOftenSelectedVal,
                    dropDownItems: addIncomeExpenseController.howOftenItems,
                  ),
                  CommonFormField(
                    context: context,
                    label: 'Associated Account',
                    isCommonContainer: true,

                    isDropDown: true,
                    selectedItem:
                        addIncomeExpenseController.accountsSelectedItems,
                    dropDownItems: accountController.accountsItems,
                    validator: (v) {
                      if (addIncomeExpenseController
                          .accountsSelectedItems.isEmpty) {
                        return ErrorMsg.ENTER_ACCOUNT;
                      }
                      return null;
                    },
                    // controller:
                    //     addIncomeExpenseController.incomeAccAccountController,
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(
              () => CustomButton(
                widget: addIncomeExpenseController.isLoading.value
                    ? const CommonCircularProgressBar()
                    : null,
                buttonText: widget.isEdit ? 'Update Income' : 'Add Income',
                backgroundColor: AppColor.darkBlueColor,
                onBtnPress: () async {
                  if (!widget.isEdit) {
                    await addIncomeExpenseController.addIncome(context);
                  } else {
                    await addIncomeExpenseController.updateIncome(
                        context, widget.incomeUuid!);
                  }
                },
                width: 16.w,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
