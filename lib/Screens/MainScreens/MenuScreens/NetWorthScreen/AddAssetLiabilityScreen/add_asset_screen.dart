import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/AddAssetLiabilityScreen/add_asset_liability_controller.dart';
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

class AddAssetScreen extends StatefulWidget {
  const AddAssetScreen(
      {super.key,
      this.isEdit = false,
      this.assetUuid,
      this.assetName,
      this.assetValue,
      this.assetAmount,
      this.assetImage});

  final bool isEdit;
  final String? assetUuid;
  final String? assetName;
  final String? assetValue;
  final String? assetAmount;
  final String? assetImage;

  @override
  State<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends State<AddAssetScreen> {
  AddAssetLiabilityController addAssetLiabilityController =
      Get.put(AddAssetLiabilityController());

ImagePicker picker = ImagePicker();

  @override
  void initState() {
    if (widget.isEdit == true) {
      addAssetLiabilityController.addNameController.text =
          widget.assetName ?? '';
      addAssetLiabilityController.addValueController.text =
          widget.assetValue ?? '';
      addAssetLiabilityController.imageName.value = widget.assetImage ?? '';
      addAssetLiabilityController.addOwingAmountController.text =
          widget.assetAmount ?? '';
    }

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    addAssetLiabilityController.clearAssetLiabilityFields();
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
                    await addAssetLiabilityController.deleteAsset(
                        context, widget.assetUuid!);
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
          widget.isEdit ? 'Update Asset' : 'Add Asset',
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
            key: addAssetLiabilityController.addAssetFormKey,
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
                    controller: addAssetLiabilityController.addNameController,
                    context: context,
                    label: 'Name',
                    isCommonContainer: true,
                    flex2: 2,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return ErrorMsg.ENTER_NAME;
                      }
                      return null;
                    },
                  ),
                  CommonFormField(
                    controller: addAssetLiabilityController.addValueController,
                    context: context,
                    label: 'Value',
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[0-9-]")),
                    ],
                    isCommonContainer: true,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return ErrorMsg.ENTER_VALUE;
                      }
                      return null;
                    },
                  ),
                  Obx(
                    ()=> CommonFormField(
                      context: context,
                      label: 'Image',
                      // controller: addAssetLiabilityController.addImage,

                      readOnly: true,
                      validator: (v) {
                        if (addAssetLiabilityController.imageName.isEmpty) {
                          return ErrorMsg.ENTER_IMAGE;
                        }
                        return null;
                      },
                      hintText: addAssetLiabilityController.imageName.value,
                      stacIcon: IconButton(
                          constraints:
                              const BoxConstraints(maxHeight: 35, minHeight: 35),
                          onPressed: pickImage,
                          icon: const Icon(Icons.file_upload_outlined)),
                      isCommonContainer: true,
                    ),
                  ),
                  CommonFormField(
                    controller:
                        addAssetLiabilityController.addOwingAmountController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return ErrorMsg.ENTER_AMOUNT;
                      }
                      return null;
                    },
                    context: context,
                    label: 'Owing amount',
                    flex2: 2,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[0-9-]")),
                    ],
                    isCommonContainer: true,
                  ),
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(
                ()=> CustomButton(
                  widget: addAssetLiabilityController.isLoading.value? const CommonCircularProgressBar():null,
                  buttonText: widget.isEdit ? 'Update Asset' : 'Add Asset',
                  backgroundColor: AppColor.darkBlueColor,
                  onBtnPress: () async {
                    if (widget.isEdit == true) {
                      await addAssetLiabilityController.updateAsset(
                          context, widget.assetUuid!);
                    } else {
                      await addAssetLiabilityController.addAsset(context);
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
        addAssetLiabilityController.imagePath.value = pickedImage.path;
        addAssetLiabilityController.imageName.value = pickedImage.name;
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    }
  }
}
