
import 'package:budget_buddie/Data/Models/cash_account_model.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/AccountScreen/AddCashAccount/add_cash_account_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/common_progress_bar.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/delete_confirm_dialog.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class AddCashAccountScreen extends StatefulWidget {
  const AddCashAccountScreen({
    super.key,
    this.accounts,
    required this.routesName,
  });

  final Accounts? accounts;
  final String routesName;

  @override
  State<AddCashAccountScreen> createState() => _AddCashAccountScreenState();
}

class _AddCashAccountScreenState extends State<AddCashAccountScreen> {
  AddCashAccountController addCashAccountController =
      Get.put(AddCashAccountController());

  ImagePicker picker = ImagePicker();
  @override
  void initState() {
    if (widget.accounts != null) {
      addCashAccountController.addNameController.text =
          widget.accounts!.accountName!;
      addCashAccountController.addValueController.text =
          widget.accounts!.value!.toString();
      addCashAccountController.imageName.value=
          widget.accounts!.avatar!;
    }
    super.initState();
  }

  @override
  void dispose() {
    addCashAccountController.clearCashAccountFields();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          if (widget.accounts != null)
            IconButton(
                onPressed: () async {
                  await deleteDialog(context, "Delete",
                      "Are you sure you want to delete this item", () async {
                    await addCashAccountController.deleteCashAccount(
                        context, widget.accounts!.accountUuid!);
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
          widget.accounts != null
              ? "Update a cash account"
              : "Add a cash account",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: addCashAccountController.addCashAccountFormKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    controller: addCashAccountController.addNameController,
                    context: context,
                    label: 'Name',
                    isCommonContainer: true,
                    flex2: 3,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return ErrorMsg.ENTER_NAME;
                      }
                      return null;
                    },
                  ),
                  CommonFormField(
                    controller: addCashAccountController.addValueController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return ErrorMsg.ENTER_AMOUNT;
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9-]")),
                    ],
                    textInputType: TextInputType.number,
                    context: context,
                    label: 'Account balance',
                    isCommonContainer: true,
                    flex1: 2,
                    flex2: 2,
                  ),
                  Obx(
                    ()=> CommonFormField(
                      validator: (v) {
                        if (addCashAccountController.imageName.isEmpty) {
                          return ErrorMsg.ENTER_IMAGE;
                        }
                        return null;
                      },
                      // controller: addCashAccountController.addImageController,
                      hintText: addCashAccountController.imageName.value,
                      stacIcon: IconButton(
                        constraints:
                            const BoxConstraints(maxHeight: 35, minHeight: 35),
                        onPressed: pickImage,
                        icon: Icon(
                          Icons.file_upload_outlined,
                          color: context.theme.textTheme.titleMedium!.color,
                        ),
                      ),
                      context: context,
                      readOnly: true,
                      label: 'Image',
                      isCommonContainer: true,
                      flex2: 3,
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(
                ()=> CustomButton(
                  widget: addCashAccountController.isLoading.value? const CommonCircularProgressBar():null,

                  buttonText:
                      widget.accounts != null ? "Update Account" : 'Add Account',
                  backgroundColor: AppColor.darkBlueColor,
                  onBtnPress: () {
                    if (widget.accounts != null) {
                      addCashAccountController.updateCashAccount(context,
                          widget.accounts!.accountUuid!, widget.routesName);
                    } else {
                      addCashAccountController.addCashAccount(context);
                    }
                  },
                  width: 16.w,
                ),
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
        addCashAccountController.imagePath.value = pickedImage.path;
        addCashAccountController.imageName.value = pickedImage.name;
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    }
  }
}
