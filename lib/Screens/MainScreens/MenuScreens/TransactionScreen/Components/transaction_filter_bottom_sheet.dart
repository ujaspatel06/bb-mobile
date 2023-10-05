import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/transaction_controller.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

TransactionController transactionController = Get.put(TransactionController());

class TransactionFilterBottomSheet {
  static void showModalSheet(
      BuildContext context, AnimationController controller) {
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
          height: MediaQuery.of(context).size.height / 1.3,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextWidget(
                        "Filter Transactions",
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
                    "Spend range",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                  ),
                  const Divider(),
                  Obx(
                    () => Wrap(
                      children: [
                        for (var i = 0;
                            i < transactionController.spendRangeType.length;
                            i++)
                          GestureDetector(
                            onTap: () {
                              transactionController.spendRangeSelected.value =
                                  transactionController.spendRangeType[i];
                            },
                            child: Chip(
                              label: TextWidget(
                                  transactionController.spendRangeType[i],
                                  color: transactionController
                                              .spendRangeSelected.value ==
                                          transactionController
                                              .spendRangeType[i]
                                      ? AppColor.whiteColor
                                      : context
                                          .theme.textTheme.titleMedium!.color),
                              backgroundColor: transactionController
                                          .spendRangeSelected.value ==
                                      transactionController.spendRangeType[i]
                                  ? SaprateLightDarkColor.greenLightColor
                                  : context.theme.primaryColor,
                              side: BorderSide(
                                  color: transactionController
                                              .spendRangeSelected.value ==
                                          transactionController
                                              .spendRangeType[i]
                                      ? context.theme.primaryColor
                                      : AppColor.greyColor),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                            ).marginSymmetric(horizontal: 5),
                            // Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     Checkbox(
                            //       value: transactionController
                            //           .spendRangeSelected
                            //           .contains(transactionController
                            //               .spendRangeType[i]),
                            //       onChanged: (val) {
                            //         if (transactionController.spendRangeSelected
                            //             .contains(transactionController
                            //                 .spendRangeType[i])) {
                            //           transactionController.spendRangeSelected
                            //               .remove(transactionController
                            //                   .spendRangeType[i]);
                            //         } else {
                            //           transactionController.spendRangeSelected
                            //               .add(transactionController
                            //                   .spendRangeType[i]);
                            //         }
                            //       },
                            //       checkColor: AppColor.whiteColor,
                            //       activeColor: AppColor.darkBlueColor,
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(5)),
                            //     ),
                            //     TextWidget(
                            //         transactionController.spendRangeType[i],
                            //         color: context
                            //             .theme.textTheme.titleMedium!.color),
                            //   ],
                            // ),
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
                  const Divider(),
                  Obx(
                    () => Wrap(
                      children: [
                        for (var i = 0;
                            i < transactionController.categoriesType.length;
                            i++)
                          GestureDetector(
                            onTap: () {
                              transactionController.categoriesSelected.value =
                                  transactionController.categoriesType[i];
                            },
                            child: Chip(
                              label: TextWidget(
                                  transactionController.categoriesType[i],
                                  color: transactionController
                                              .categoriesSelected.value ==
                                          transactionController
                                              .categoriesType[i]
                                      ? AppColor.whiteColor
                                      : context
                                          .theme.textTheme.titleMedium!.color),
                              backgroundColor: transactionController
                                          .categoriesSelected.value ==
                                      transactionController.categoriesType[i]
                                  ? SaprateLightDarkColor.greenLightColor
                                  : context.theme.primaryColor,
                              side: BorderSide(
                                  color: transactionController
                                              .categoriesSelected.value ==
                                          transactionController
                                              .categoriesType[i]
                                      ? context.theme.primaryColor
                                      : AppColor.greyColor),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                            ).marginSymmetric(horizontal: 5),
                            // GestureDetector(
                            //   onTap: () {
                            //     if (transactionController.categoriesSelected
                            //         .contains(transactionController
                            //             .categoriesType[i])) {
                            //       transactionController.categoriesSelected.remove(
                            //           transactionController.categoriesType[i]);
                            //     } else {
                            //       transactionController.categoriesSelected.add(
                            //           transactionController.categoriesType[i]);
                            //     }
                            //   },
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       Checkbox(
                            //         value: transactionController
                            //             .categoriesSelected
                            //             .contains(transactionController
                            //                 .categoriesType[i]),
                            //         onChanged: (val) {
                            //           if (transactionController.categoriesSelected
                            //               .contains(transactionController
                            //                   .categoriesType[i])) {
                            //             transactionController.categoriesSelected
                            //                 .remove(transactionController
                            //                     .categoriesType[i]);
                            //           } else {
                            //             transactionController.categoriesSelected
                            //                 .add(transactionController
                            //                     .categoriesType[i]);
                            //           }
                            //         },
                            //         checkColor: AppColor.whiteColor,
                            //         activeColor: AppColor.darkBlueColor,
                            //         shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(5)),
                            //       ),
                            //       TextWidget(
                            //           transactionController.categoriesType[i],
                            //           color: context
                            //               .theme.textTheme.titleMedium!.color),
                            //     ],
                            //   ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    "Date range",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                  ),
                  const Divider(),
                  Obx(
                    () => Wrap(
                      children: [
                        for (var i = 0;
                            i < transactionController.dateRangeType.length;
                            i++)
                          GestureDetector(
                            onTap: () {
                              transactionController.dateRangeSelected.value =
                                  transactionController.dateRangeType[i];
                            },
                            child: Chip(
                              label: TextWidget(
                                  transactionController.dateRangeType[i],
                                  color: transactionController
                                              .dateRangeSelected.value ==
                                          transactionController.dateRangeType[i]
                                      ? AppColor.whiteColor
                                      : context
                                          .theme.textTheme.titleMedium!.color),
                              backgroundColor: transactionController
                                          .dateRangeSelected.value ==
                                      transactionController.dateRangeType[i]
                                  ? SaprateLightDarkColor.greenLightColor
                                  : context.theme.primaryColor,
                              side: BorderSide(
                                  color: transactionController
                                              .dateRangeSelected.value ==
                                          transactionController.dateRangeType[i]
                                      ? context.theme.primaryColor
                                      : AppColor.greyColor),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                            ).marginSymmetric(horizontal: 5),
                            // GestureDetector(
                            //   onTap: () {
                            //     if (transactionController.spendRangeSelected
                            //         .contains(
                            //             transactionController.dateRangeType[i])) {
                            //       transactionController.spendRangeSelected.remove(
                            //           transactionController.dateRangeType[i]);
                            //     } else {
                            //       transactionController.spendRangeSelected.add(
                            //           transactionController.dateRangeType[i]);
                            //     }
                            //   },
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       Checkbox(
                            //         value: transactionController
                            //             .spendRangeSelected
                            //             .contains(transactionController
                            //                 .dateRangeType[i]),
                            //         onChanged: (val) {
                            //           if (transactionController.spendRangeSelected
                            //               .contains(transactionController
                            //                   .dateRangeType[i])) {
                            //             transactionController.spendRangeSelected
                            //                 .remove(transactionController
                            //                     .dateRangeType[i]);
                            //           } else {
                            //             transactionController.spendRangeSelected
                            //                 .add(transactionController
                            //                     .dateRangeType[i]);
                            //           }
                            //         },
                            //         checkColor: AppColor.whiteColor,
                            //         activeColor: AppColor.darkBlueColor,
                            //         shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(5)),
                            //       ),
                            //       TextWidget(
                            //           transactionController.dateRangeType[i],
                            //           color: context
                            //               .theme.textTheme.titleMedium!.color),
                            //     ],
                            //   ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
