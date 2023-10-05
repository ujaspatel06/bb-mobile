
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/AddTransactionScreen/add_transaction_controller.dart';
import 'package:budget_buddie/Utils/Utils.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  AddTransactionController addTransactionController =
      Get.put(AddTransactionController());

  ImagePicker picker = ImagePicker();

   
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
        ],
        titleWidget: TextWidget(
          "Add Transaction",
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
              Form(
                key: addTransactionController.addTransactionKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    boxShadow: [commonBoxshdow()],
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  CommonFormField(
                    context: context,
                    controller: addTransactionController.nameController,
                    label: 'Name',
                    isCommonContainer: true,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return ErrorMsg.ENTER_NAME;
                      }
                      return null;
                    },
                    flex2: 3,
                  ),
                  CommonFormField(
                    context: context,
                    controller: addTransactionController.dateController,
                    stacIcon: IconButton(
                      constraints:
                      const BoxConstraints(maxHeight: 35, minHeight: 35),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary:context.theme.hintColor,
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
                            initialDate: addTransactionController.dateController.text.isEmpty
                                ? DateTime.now()
                                : parseCustomFormat(addTransactionController.dateController.text),

                            //get today's date
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000));

                        if (pickedDate != null) {
                          String formattedDate =
                          DateFormat('MM-dd-yyyy').format(pickedDate);

                          addTransactionController.dateController.text =
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
                    label: 'Date',
                    isCommonContainer: true,
                    flex2: 3,
                  ),
                  CommonFormField(
                    context: context,
                    controller: addTransactionController.amountController,

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
                    label: 'Amount',
                    isCommonContainer: true,
                    flex2: 3,
                  ),
                  CommonFormField(
                    context: context,
                    label: 'Category',
                    isCommonContainer: true,
                    isDropDown: true,
                    selectedItem: addTransactionController.tempSelectedValue,
                    dropDownItems: addTransactionController.tempItems,
                    flex2: 2,
                  ),
                  CommonFormField(
                    context: context,
                    label: 'Merchant',
                    isCommonContainer: true,
                    isDropDown: true,
                    selectedItem: addTransactionController.tempSelectedValue,
                    dropDownItems: addTransactionController.tempItems,
                    flex2: 2,
                  ),
                  CommonFormField(
                    context: context,
                    label: 'Account',
                    isCommonContainer: true,
                    isDropDown: true,
                    selectedItem: addTransactionController.tempSelectedValue,
                    dropDownItems: addTransactionController.tempItems,
                    flex2: 2,
                  ),
                  Obx(
                    ()=> CommonFormField(
                      stacIcon: IconButton(
                        constraints:
                              const BoxConstraints(maxHeight: 35, minHeight: 35),
                          onPressed: pickImage,
                          icon: Icon(
                            Icons.file_upload_outlined,
                            color: context.theme.textTheme.titleMedium!.color,
                          )),
                      context: context,
                      readOnly: true,
                      // controller: addTransactionController.imageController,
                      validator: (v) {
                        if ( addTransactionController.imageName.isEmpty) {
                          return ErrorMsg.ENTER_IMAGE;
                        }
                        return null;
                      },
                      label: 'Image',
                      hintText: addTransactionController.imageName.value,
                      isCommonContainer: true,
                      flex2: 3,
                    ),
                  ),
                ]),
            ),
            const SizedBox(
                height: 40,
            ),
            CustomButton(
                buttonText: 'Add Transaction',

                onBtnPress: () {},
                width: 16.w,
            ),
          ]),
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
        addTransactionController.imagePath.value = pickedImage.path;
        addTransactionController.imageName.value = pickedImage.name;
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    }
  }
}
