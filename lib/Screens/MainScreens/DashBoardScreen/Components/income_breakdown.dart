import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_dropdown.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class IncomeBreakdown extends StatefulWidget {
  const IncomeBreakdown({super.key});

  @override
  State<IncomeBreakdown> createState() => _IncomeBreakdownState();
}

class _IncomeBreakdownState extends State<IncomeBreakdown> {
  DashBoardController dashBoardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return isLoading?_shimmerIncomeBreakdown():  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            "Income breakdown",
            fontSize: 16.sp,
            color: context.theme.textTheme.titleMedium!.color,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            // height: 200,
            padding: const EdgeInsets.all(20.0),

            decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [commonBoxshdow(blurRadius: 30)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TextWidget(
                      "Income breakdown",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: context.theme.textTheme.titleMedium!.color,
                    ),
                    const Spacer(),
                    TextWidget(
                      "\$5000",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.greenAssentColor,
                    ),
                  ],
                ),
                Obx(
                  () => CustomDropdownButtonWithList(
                    dropDownList: dashBoardController.tempItemsList,
                    onChanged: (String? value) {
                      dashBoardController.tempSelectedValue2.value = value!;
                    },
                    value: dashBoardController.tempSelectedValue2.value,
                  ),
                ),
                SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 14.w,
                              height: dashBoardController
                                  .getBreakDownIncomeHeight(1500),
                              padding: const EdgeInsets.only(bottom: 4),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColor.blueColor.withOpacity(0.3)),
                              child: TextWidget("Pay",
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8.sp),
                            ),
                            Container(
                              width: 14.w,
                              height: dashBoardController
                                  .getBreakDownIncomeHeight(3000),
                              padding: const EdgeInsets.only(bottom: 4),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.red.withOpacity(0.3)),
                              child: TextWidget("Rental",
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8.sp),
                            ),
                            Container(
                              width: 14.w,
                              height: dashBoardController
                                  .getBreakDownIncomeHeight(2000),
                              padding: const EdgeInsets.only(bottom: 4),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.pink.withOpacity(0.3)),
                              child: TextWidget("Invest",
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8.sp),
                            ),
                            Container(
                              width: 14.w,
                              height: dashBoardController
                                  .getBreakDownIncomeHeight(2500),
                              padding: const EdgeInsets.only(bottom: 4),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.yellow.withOpacity(0.3)),
                              child: TextWidget("Other",
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8.sp),
                            ),
                            Container(
                              width: 14.w,
                              height: dashBoardController
                                  .getBreakDownIncomeHeight(5000),
                              padding: const EdgeInsets.only(bottom: 4),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green),
                              child: TextWidget("Total",
                                  color: context
                                      .theme.textTheme.titleMedium!.color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 8.sp),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],

    );
  }


  Widget _shimmerIncomeBreakdown()
  {
    return  Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 24,width: 150, decoration: ShapeDecoration(
            color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),),
          SizedBox(height: 10,),
          Container(
            height: 210,
            decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(30),
                ),
          ),
        ],
      ),
    );
  }
}
