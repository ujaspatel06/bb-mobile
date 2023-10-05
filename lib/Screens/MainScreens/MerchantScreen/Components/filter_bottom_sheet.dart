import 'package:budget_buddie/Screens/MainScreens/MerchantScreen/merchant_controller.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

MerchantController merchantController = Get.put(MerchantController());

class MerchantFilterBottomSheet {
  static void showModalSheet(BuildContext context,AnimationController controller) {
    showModalBottomSheet(
      transitionAnimationController: controller,
        context: context,
        backgroundColor: context.theme.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        isScrollControlled: true,
        isDismissible: true,
        useRootNavigator: true,
        builder: (builder) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            "Filter Merchants",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: context.theme.textTheme.titleMedium!.color,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.close,
                              color: context.theme.textTheme.titleMedium!.color,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        "Merchant type",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: context.theme.textTheme.titleMedium!.color,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Wrap(
                          children: [
                            for (var i = 0;
                                i < merchantController.merchantType.length;
                                i++)
                              GestureDetector(
                                onTap: () {
                                  merchantController
                                          .selectedMerchantType.value =
                                      merchantController.merchantType[i];
                                },
                                child: Chip(
                                  label: TextWidget(
                                      merchantController.merchantType[i],
                                      color: merchantController
                                                  .selectedMerchantType.value ==
                                              merchantController.merchantType[i]
                                          ? AppColor.whiteColor
                                          : context.theme.textTheme.titleMedium!
                                              .color),
                                  backgroundColor: merchantController
                                              .selectedMerchantType.value ==
                                          merchantController.merchantType[i]
                                      ? SaprateLightDarkColor.greenLightColor
                                      : context.theme.primaryColor,
                                  side: BorderSide(
                                      color: merchantController
                                                  .selectedMerchantType.value ==
                                              merchantController.merchantType[i]
                                          ? context.theme.primaryColor
                                          : AppColor.greyColor),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                ).marginSymmetric(horizontal: 5),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        "Categories",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: context.theme.textTheme.titleMedium!.color,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Wrap(
                          children: [
                            for (var i = 0;
                                i < merchantController.categoriesType.length;
                                i++)
                              GestureDetector(
                                onTap: () {
                                  merchantController
                                          .selectedCategoriesType.value =
                                      merchantController.categoriesType[i];
                                },
                                child: Chip(
                                  label: TextWidget(
                                      merchantController.categoriesType[i],
                                      color: merchantController
                                                  .selectedCategoriesType
                                                  .value ==
                                              merchantController
                                                  .categoriesType[i]
                                          ? AppColor.whiteColor
                                          : context.theme.textTheme.titleMedium!
                                              .color),
                                  backgroundColor: merchantController
                                              .selectedCategoriesType.value ==
                                          merchantController.categoriesType[i]
                                      ? SaprateLightDarkColor.greenLightColor
                                      : context.theme.primaryColor,
                                  side: BorderSide(
                                      color: merchantController
                                                  .selectedCategoriesType
                                                  .value ==
                                              merchantController
                                                  .categoriesType[i]
                                          ? context.theme.primaryColor
                                          : AppColor.greyColor),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                ).marginSymmetric(horizontal: 5),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        "Filter by spend",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: context.theme.textTheme.titleMedium!.color,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => Wrap(
                          children: [
                            for (var i = 0;
                                i < merchantController.filterBySpendType.length;
                                i++)
                              GestureDetector(
                                onTap: () {
                                  merchantController
                                          .selectedFilterBySpendType.value =
                                      merchantController.filterBySpendType[i];
                                },
                                child: Chip(
                                  label: TextWidget(
                                      merchantController.filterBySpendType[i],
                                      color: merchantController
                                                  .selectedFilterBySpendType
                                                  .value ==
                                              merchantController
                                                  .filterBySpendType[i]
                                          ? AppColor.whiteColor
                                          : context.theme.textTheme.titleMedium!
                                              .color),
                                  backgroundColor: merchantController
                                              .selectedFilterBySpendType
                                              .value ==
                                          merchantController
                                              .filterBySpendType[i]
                                      ? SaprateLightDarkColor.greenLightColor
                                      : context.theme.primaryColor,
                                  side: BorderSide(
                                      color: merchantController
                                                  .selectedFilterBySpendType
                                                  .value ==
                                              merchantController
                                                  .filterBySpendType[i]
                                          ? context.theme.primaryColor
                                          : AppColor.greyColor),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                ).marginSymmetric(horizontal: 5),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
