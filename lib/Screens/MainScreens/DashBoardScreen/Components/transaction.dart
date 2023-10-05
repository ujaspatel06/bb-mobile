import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/transaction_screen.dart';
import 'package:budget_buddie/Utils/Widgets/common_chip.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/box_shadow.dart';
import '../../../../Utils/constant.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  DashBoardController dashBoardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return isLoading?_shimmerTransaction():Column(
      children: [
        Row(
          children: [
            TextWidget(
              "Transactions",
              fontSize: 16.sp,
              color: context.theme.textTheme.titleMedium!.color,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            if (!dashBoardController.isWidegetHide("Transaction"))
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                    context,
                    settings:
                        const RouteSettings(name: Routes.transactionScreen),
                    screen: const TransactionScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.fade,
                  );
                },
              child: const CommonChip(title: "See all")

              ),
          ],
        ).marginOnly(bottom: !dashBoardController.isWidegetHide("Transaction")?5:0),
        const SizedBox(
          height: 5,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 7),
                padding: const EdgeInsets.all(13),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: context.theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [commonBoxshdow(blurRadius: 30)],
                ),
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
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget("Countdown",
                              fontWeight: FontWeight.w600,
                              color: context.theme.textTheme.titleMedium!.color,
                              textAlign: TextAlign.start,
                              maxLine: 1,
                              fontSize: 13.sp),
                          const SizedBox(
                            height: 6,
                          ),
                          TextWidget("Groceries - Today",
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                              color: AppColor.greyColor,
                              fontSize: 11.sp),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextWidget("+\$3052.00",
                        fontWeight: FontWeight.w600,
                        color: AppColor.greenAssentColor,
                        fontSize: 12.sp),
                  ],
                ),
              );
            }),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
  Widget _shimmerTransaction() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
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
