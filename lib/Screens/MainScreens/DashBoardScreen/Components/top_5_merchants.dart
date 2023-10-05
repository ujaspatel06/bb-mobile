import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Utils/Widgets/common_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/box_shadow.dart';
import '../../../../Utils/Widgets/common_chip.dart';
import '../../../../Utils/constant.dart';

class Top5Merchants extends StatefulWidget {
  const Top5Merchants({super.key});

  @override
  State<Top5Merchants> createState() => _Top5MerchantsState();
}

class _Top5MerchantsState extends State<Top5Merchants> {
  DashBoardController dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return isLoading?_shimmerTopMerchant():Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextWidget(
              "Top 5 Merchants",
              fontSize: 16.sp,
              color: context.theme.textTheme.titleMedium!.color,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            if (!dashBoardController.isWidegetHide("Top 5 Merchants"))
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
                         ()=> Wrap(
                              children: [
                                for (var i = 0;
                                i <
                                    dashBoardController
                                        .dateRangeItem.length;
                                i++)
                                  GestureDetector(
                                    onTap: () {
                                      dashBoardController
                                          .top5MerchantSelectedItem.value =
                                      dashBoardController.dateRangeItem[i];
                                      Get.back();
                                    },
                                    child: Chip(
                                      visualDensity: const VisualDensity(
                                          vertical: -3, horizontal: 0),
                                      label: TextWidget(
                                          dashBoardController.dateRangeItem[i],
                                          fontSize: 10.sp,
                                          color: dashBoardController
                                              .top5MerchantSelectedItem
                                              .value ==
                                              dashBoardController
                                                  .dateRangeItem[i]
                                              ? AppColor.whiteColor
                                              : context.theme.textTheme
                                              .titleMedium!.color),
                                      backgroundColor: dashBoardController
                                          .top5MerchantSelectedItem
                                          .value ==
                                          dashBoardController
                                              .dateRangeItem[i]
                                          ? SaprateLightDarkColor
                                          .greenLightColor
                                          : context.theme.primaryColor,
                                      side: BorderSide(
                                          color: dashBoardController
                                              .top5MerchantSelectedItem
                                              .value ==
                                              dashBoardController
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
                      title:
                      dashBoardController.top5MerchantSelectedItem.value),
                ),
              ),
              // Obx(
              //   () => CustomDropdownButtonWithList(
              //     dropDownList: dashBoardController.tempItemsList,
              //     onChanged: (String? value) {
              //       dashBoardController.tempSelectedValue2.value = value!;
              //     },
              //     value: dashBoardController.tempSelectedValue2.value,
              //   ),
              // ),
          ],
        ).marginOnly(bottom: !dashBoardController.isWidegetHide("Top 5 Merchants")?12:0),
        if (dashBoardController.isWidegetHide("Top 5 Merchants"))
          const SizedBox(
            height: 10,
          ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: context.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [commonBoxshdow(blurRadius: 30)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
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
                          width: 5.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget("Trademe",
                                  fontWeight: FontWeight.w600,
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  textAlign: TextAlign.start,
                                  maxLine: 1,
                                  fontSize: 13.sp),
                              const SizedBox(
                                height: 4,
                              ),
                              TextWidget("8 Transactions",
                                  textAlign: TextAlign.start,
                                  maxLine: 1,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.greyColor,
                                  fontSize: 11.sp),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget("\$352.00",
                     
                            fontWeight: FontWeight.w600,
                            color: AppColor.redColor,
                            fontSize: 12.sp),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }

  Widget _shimmerTopMerchant() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Column(
                children: [
                  if(index==0)...[
                    Row(
                      children: [
                        Container(height: 24,width: 150, decoration: ShapeDecoration(
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),),
                        Spacer(),
                        CommonChip(title: "title")
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                  Container(
                    height: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

}
