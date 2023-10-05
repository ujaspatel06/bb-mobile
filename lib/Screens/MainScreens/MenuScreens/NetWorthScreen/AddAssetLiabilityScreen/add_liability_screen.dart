import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/AddAssetLiabilityScreen/add_asset_liability_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/net_worth_controller.dart';
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

class AddLiabilityScreen extends StatefulWidget {
  const AddLiabilityScreen({
    super.key,
    this.isEdit = false,
    this.liabilityUuid,
    this.liabilityName,
    this.liabilityValue,
    this.linkToAsset,
    this.liabilityImage,
  });

  final bool isEdit;
  final String? liabilityUuid;
  final String? liabilityName;
  final String? liabilityValue;
  final String? linkToAsset;
  final String? liabilityImage;

  @override
  State<AddLiabilityScreen> createState() => _AddLiabilityScreenState();
}

class _AddLiabilityScreenState extends State<AddLiabilityScreen> {
  AddAssetLiabilityController addAssetLiabilityController =
      Get.put(AddAssetLiabilityController());
  NetWorthController netWorthController = Get.put(NetWorthController());
  ImagePicker picker = ImagePicker();

  @override
  void dispose() {
    // TODO: implement dispose
    addAssetLiabilityController.clearAssetLiabilityFields();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.isEdit == true) {
      addAssetLiabilityController.addNameController.text =
          widget.liabilityName ?? '';
      addAssetLiabilityController.addValueController.text =
          widget.liabilityValue ?? '';
      addAssetLiabilityController.imageName.value = widget.liabilityImage ?? '';
      netWorthController.assetSelectedItem.value = widget.linkToAsset ?? '';
    }

    super.initState();
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
                    await addAssetLiabilityController.deleteLiability(
                        context, widget.liabilityUuid!);
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
          widget.isEdit ? 'Update Liability' : 'Add Liability',
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
            key: addAssetLiabilityController.addLiabilityFormKey,
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
                    validator: (v) {
                      if (v!.isEmpty) {
                        return ErrorMsg.ENTER_NAME;
                      }
                      return null;
                    },
                    context: context,
                    label: 'Name',
                    isCommonContainer: true,
                    flex2: 2,
                  ),
                  CommonFormField(
                    controller: addAssetLiabilityController.addValueController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return ErrorMsg.ENTER_VALUE;
                      }
                      return null;
                    },
                    context: context,
                    label: 'Value',
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[0-9-]")),
                    ],
                    isCommonContainer: true,
                  ),
                  Obx(
                    ()=> CommonFormField(
                      context: context,
                      label: 'Image',
                      validator: (v) {
                        if (addAssetLiabilityController.imageName.isEmpty) {
                          return ErrorMsg.ENTER_IMAGE;
                        }
                        return null;
                      },
                      readOnly: true,
                      // controller: addAssetLiabilityController.imageName.va,
                      hintText: addAssetLiabilityController.imageName.value,
                      stacIcon: IconButton(
                          constraints:
                              const BoxConstraints(maxHeight: 35, minHeight: 35),
                          onPressed: pickImage,
                          icon: const Icon(Icons.file_upload_outlined)),
                      isCommonContainer: true,
                    ),
                  ),
                  // if (netWorthController.assetsItem.length <= 1) ...[
                  //   CommonFormField(
                  //     context: context,
                  //     label: 'Link to an Asset',
                  //     hintText: netWorthController.assetsItem.length == 1
                  //         ? netWorthController.assetSelectedItem.value
                  //         : "Please add asset",
                  //     readOnly: true,
                  //     validator: (v) {
                  //       if (netWorthController.assetsItem.isEmpty) {
                  //         return "Please add asset";
                  //       }
                  //       return null;
                  //     },
                  //     isCommonContainer: true,
                  //     flex2: 2,
                  //   ),
                  // ] else ...[
                    CommonFormField(
                      context: context,
                      label: 'Link to an Asset',
                      flex2: 2,
                      isDropDown: true,
                      selectedItem: netWorthController.assetSelectedItem,
                      dropDownItems: netWorthController.assetsItem,
                      isCommonContainer: true,
                    ),
                  // ]
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(
                ()=> CustomButton(
                  widget: addAssetLiabilityController.isLoading.value? const CommonCircularProgressBar():null,

                  buttonText:
                      widget.isEdit ? 'Update Liability' : 'Add Liability',
                  backgroundColor: AppColor.darkBlueColor,
                  onBtnPress: () {
                    if (widget.isEdit == true) {
                      addAssetLiabilityController.updateLiability(
                          context, widget.liabilityUuid!);
                    } else {
                      addAssetLiabilityController.addLiability(context);
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
