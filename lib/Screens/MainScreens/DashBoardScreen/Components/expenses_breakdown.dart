import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_dropdown.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ExpensesBreakdown extends StatefulWidget {
  const ExpensesBreakdown({super.key});

  @override
  State<ExpensesBreakdown> createState() => _ExpensesBreakdownState();
}

class _ExpensesBreakdownState extends State<ExpensesBreakdown> {
  DashBoardController dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return isLoading?_shimmerExpensesBreakdown():
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          "Expenses breakdown",
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
                    "Expenses breakdown",
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
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: dashBoardController.expenseBreakDownType.length,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Obx(
                          () => GestureDetector(
                              onTap: () {
                                dashBoardController.selectedType.value = index;
                              },
                              child: expenseBreakdownContainer(
                                  context,
                                  dashBoardController
                                      .expenseBreakDownType[index],
                                  index,
                                  dashBoardController
                                      .expenseBreakDownHeight[index])),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }



  Widget expenseBreakdownContainer(
      BuildContext context, String name, int index, double height) {
    return Container(
      height: dashBoardController.getBreakDownExpensesHeight(height),
      //(MediaQuery.of(context).size.width -
      // (80 + (10 * 6))) /
      // 10,
      // Calculate Width by item count and mediaquerty
      width: (MediaQuery.of(context).size.width - (80 + (8 * 6))) / 8,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: ShapeDecoration(
        color: dashBoardController.selectedType.value == index
            ? Colors.blue
            : Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: RotatedBox(
        quarterTurns: 3,
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextWidget(
            name,
            color: context.theme.textTheme.titleLarge!.color,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _shimmerExpensesBreakdown()
  {
    return  Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 24,width: 150, decoration: ShapeDecoration(
          color: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),),
        SizedBox(height: 10,),
        Container(
          height: 330,
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
