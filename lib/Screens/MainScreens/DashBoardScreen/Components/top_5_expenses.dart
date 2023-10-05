import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_bottom_sheet.dart';
import 'package:budget_buddie/Utils/Widgets/common_chip.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/constant.dart';

class Top5Expenses extends StatefulWidget {
  const Top5Expenses({super.key});

  @override
  State<Top5Expenses> createState() => _Top5ExpensesState();
}

class _Top5ExpensesState extends State<Top5Expenses> {
  DashBoardController dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return isLoading?_shimmerTopExpenses():Column(
      children: [
        Row(
          children: [
            TextWidget(
              "Top 5 expenses",
              fontSize: 16.sp,
              color: context.theme.textTheme.titleMedium!.color,
              fontWeight: FontWeight.w500,
            ),
            const Spacer(),
            if (!dashBoardController.isWidegetHide("Top 5 expenses"))
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
                                              .top5ExpensesSelectedItem.value =
                                          dashBoardController.dateRangeItem[i];
                                      Get.back();
                                    },
                                    child: Chip(
                                      visualDensity: const VisualDensity(vertical: -3,horizontal: 0),
                                      label: TextWidget(

                                          dashBoardController
                                              .dateRangeItem[i],
                                          fontSize: 10.sp,
                                          color: dashBoardController
                                                      .top5ExpensesSelectedItem
                                                      .value ==
                                                  dashBoardController
                                                      .dateRangeItem[i]
                                              ? AppColor.whiteColor
                                              : context.theme.textTheme
                                                  .titleMedium!.color),
                                      backgroundColor: dashBoardController
                                                  .top5ExpensesSelectedItem
                                                  .value ==
                                              dashBoardController
                                                  .dateRangeItem[i]
                                          ? SaprateLightDarkColor
                                              .greenLightColor
                                          : context.theme.primaryColor,
                                      side: BorderSide(
                                          color: dashBoardController
                                                      .top5ExpensesSelectedItem
                                                      .value ==
                                                  dashBoardController
                                                      .dateRangeItem[i]
                                              ? context.theme.primaryColor
                                              : AppColor.greyColor),
                                    ).marginOnly(right: 10,bottom: 5),
                                  ),
                              ],
                            ),
                        ),

                      ],
                    ),
                  );
                },
                child:  Obx(()=> CommonChip(title: dashBoardController.top5ExpensesSelectedItem.value)))
            //   Obx(
            //     () => CustomDropdownButtonWithList(
            //       dropDownList: dashBoardController.tempItemsList,
            //       onChanged: (String? value) {

            //         dashBoardController.tempSelectedValue2.value = value!;
            //       },
            //       value: dashBoardController.tempSelectedValue2.value,
            //     ),
            //   ),
          ],
        ).marginOnly(
            bottom:
                !dashBoardController.isWidegetHide("Top 5 expenses") ? 12 : 0),
        if (dashBoardController.isWidegetHide("Top 5 expenses"))
          const SizedBox(
            height: 10,
          ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 145,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 15),
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 16,
                            left: 36,
                            right: 36,
                            bottom: 16,
                          ),
                          decoration: ShapeDecoration(
                            color:
                                dashBoardController.dashboardGridColor[index],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [commonBoxshdow(blurRadius: 5)],
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                decoration: ShapeDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    "${index + 1}",
                                    color: AppColor.blackColor,
                                    textAlign: TextAlign.center,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 28),
                              TextWidget(
                                "Car",
                                color:
                                    context.theme.textTheme.labelLarge!.color,
                                textAlign: TextAlign.center,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              const SizedBox(height: 3),
                              TextWidget(
                                "\$ 2,000",
                                color:
                                    context.theme.textTheme.labelLarge!.color,
                                textAlign: TextAlign.center,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget _shimmerTopExpenses(){
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        children: [
          Row(
            children: [
              Container(height: 24,width: 150, decoration: ShapeDecoration(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),),
              const Spacer(),

          CommonChip(title: dashBoardController.top5ExpensesSelectedItem.value)

            ],
          ),
            const SizedBox(
              height: 10,
            ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 145,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10, right: 15),
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 16,
                              left: 64,
                              right: 64,
                              bottom: 16,
                            ),
                            decoration: ShapeDecoration(
                              color:
                              dashBoardController.dashboardGridColor[index],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),

                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
