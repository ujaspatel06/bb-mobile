import 'dart:io';

import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_avatar_chip.dart';
import 'package:budget_buddie/Utils/Widgets/common_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/common_chip.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import 'merchant_details_controller.dart';

class MerchantDetailsScreen extends StatefulWidget {
  const MerchantDetailsScreen({super.key, this.merchantDetailName});

  final String? merchantDetailName;

  @override
  State<MerchantDetailsScreen> createState() => _MerchantDetailsScreenState();
}

class _MerchantDetailsScreenState extends State<MerchantDetailsScreen> {
  MerchantDetailsController merchantDetailController =
      Get.put(MerchantDetailsController());

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
              color: context.theme.textTheme.titleMedium!.color,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        titleWidget: TextWidget(
          "Merchant details",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    ()=> InkWell(
                      onTap: pickImage,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(6),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                boxShadow: [commonBoxshdow(blurRadius: 30)],
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: merchantDetailController.imagePath.isEmpty
                                      ? const NetworkImage(
                                              "https://i.pinimg.com/736x/20/71/fa/2071fa9455694158a1a542a8f1fa4862--mobile-ui-smartphone.jpg")
                                          as ImageProvider
                                      : FileImage(
                                          File(
                                              merchantDetailController.imagePath.value
                                          ),
                                        ),
                                )),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: SaprateLightDarkColor.greenLightColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 5,
                                  color: context.theme.scaffoldBackgroundColor),
                            ),
                            child: Icon(
                              Icons.photo_camera_outlined,
                              size: 17,
                              color: context.theme.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.center,
                child: TextWidget(widget.merchantDetailName ?? "Countdown",
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 14.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget("\$560.80 ",
                      fontWeight: FontWeight.w400,
                      color: AppColor.greenAssentColor,
                      fontSize: 9.sp),
                  TextWidget("| 5 Transactions",
                      fontWeight: FontWeight.w400,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontSize: 9.sp),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                    onTap: () {
                      commonModalSheet(
                        context,
                        title: "Merchant categories",
                        heigth: 2.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              "Category",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: context.theme.textTheme.titleMedium!.color,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(
                              ()=> Wrap(
                                children: [
                                  for (var i = 0;
                                      i <
                                          merchantDetailController
                                              .merchantDetailList.length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        merchantDetailController
                                                .merchantDetailSelectItem.value =
                                            merchantDetailController
                                                .merchantDetailList[i];
                                        Get.back();
                                      },
                                      child: Chip(
                                        avatar: Container(
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                color: AppColor.pinkLightColor,
                                                shape: BoxShape.circle),
                                            child: const TextWidget(
                                              "👌🏻",
                                              fontSize: 11,
                                            )),
                                        label: TextWidget(
                                            merchantDetailController
                                                .merchantDetailList[i],
                                            fontSize: 10.sp,
                                            color: context.theme.textTheme
                                                .titleMedium!.color),
                                        backgroundColor: Colors.transparent,
                                        side:
                                            const BorderSide(color: AppColor.greyColor),
                                      ).marginOnly(right: 10),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Obx(
                      () => FittedBox(
                        alignment: Alignment.centerRight,
                        child: CommonAvatarChip(
                          title: merchantDetailController
                              .merchantDetailSelectItem.value,
                          avatar: '👌🏻',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  TextWidget(
                    "Your spend history",
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
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
                              color: context.theme.textTheme.titleMedium!.color,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(
                              () => Wrap(
                                children: [
                                  for (var i = 0;
                                      i <
                                          merchantDetailController
                                              .dateRangeItem.length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        merchantDetailController
                                                .spendHistorySelectedItem
                                                .value =
                                            merchantDetailController
                                                .dateRangeItem[i];
                                        Get.back();
                                      },
                                      child: Chip(
                                        visualDensity: const VisualDensity(
                                            vertical: -3, horizontal: 0),
                                        label: TextWidget(
                                            merchantDetailController
                                                .dateRangeItem[i],
                                            fontSize: 10.sp,
                                            color: merchantDetailController
                                                        .spendHistorySelectedItem
                                                        .value ==
                                                    merchantDetailController
                                                        .dateRangeItem[i]
                                                ? AppColor.whiteColor
                                                : context.theme.textTheme
                                                    .titleMedium!.color),
                                        backgroundColor: merchantDetailController
                                                    .spendHistorySelectedItem
                                                    .value ==
                                                merchantDetailController
                                                    .dateRangeItem[i]
                                            ? SaprateLightDarkColor
                                                .greenLightColor
                                            : context.theme.primaryColor,
                                        side: BorderSide(
                                            color: merchantDetailController
                                                        .spendHistorySelectedItem
                                                        .value ==
                                                    merchantDetailController
                                                        .dateRangeItem[i]
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
                          title: merchantDetailController
                              .spendHistorySelectedItem.value),
                    ),
                  ),
                  // Obx(
                  //   () => CustomDropdownButtonWithList(
                  //     dropDownList: merchantDetailController.tempItemsList,
                  //     onChanged: (String? value) {
                  //       merchantDetailController.tempSelectedValue2.value =
                  //           value!;
                  //     },
                  //     value: merchantDetailController.tempSelectedValue2.value,
                  //   ),
                  // ),
                ],
              ).marginOnly(bottom: 5),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 7),
                padding: const EdgeInsets.all(11),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: context.theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: [commonBoxshdow(blurRadius: 30)],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
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
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget("Ami insurance",
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.start,
                              maxLine: 1,
                              color: context.theme.textTheme.titleMedium!.color,
                              fontSize: 11.5.sp),
                          const SizedBox(
                            height: 6,
                          ),
                          TextWidget("Grociery",
                              textAlign: TextAlign.start,
                              maxLine: 1,
                              fontWeight: FontWeight.w400,
                              color: AppColor.textSecondaryColor,
                              fontSize: 10.sp),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextWidget("\$3052.00",
                        fontWeight: FontWeight.w600,
                        color: AppColor.redColor,
                        fontSize: 12.sp),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextWidget(
                "Transactions",
                color: context.theme.textTheme.titleMedium!.color,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 5,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index % 2 == 0 && index != 0) ...[
                          const SizedBox(
                            height: 12,
                          ),
                          TextWidget(
                            "11th October",
                            color: context.theme.textTheme.titleMedium!.color,
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 7),
                          padding: const EdgeInsets.all(11),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: context.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: [commonBoxshdow(blurRadius: 30)],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
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
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget("Ami insurance",
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.start,
                                        maxLine: 1,
                                        color: context
                                            .theme.textTheme.titleMedium!.color,
                                        fontSize: 11.5.sp),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    TextWidget("Grociery",
                                        textAlign: TextAlign.start,
                                        maxLine: 1,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.textSecondaryColor,
                                        fontSize: 10.sp),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextWidget("\$3052.00",
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.redColor,
                                  fontSize: 12.sp),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    );
                  }),
            ],
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
        merchantDetailController.imagePath.value = pickedImage.path;
        merchantDetailController.imageName.value = pickedImage.name;
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    }
  }
}
