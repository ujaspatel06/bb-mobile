// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/custom_rotation_icon.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/text_widget.dart';
import '../../../../Utils/constant.dart';

class TotalBalance extends StatefulWidget {
  const TotalBalance({super.key});

  @override
  State<TotalBalance> createState() => _TotalBalanceState();
}

class _TotalBalanceState extends State<TotalBalance> {
  DashBoardController dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>
      // !dashBoardController.load.value?_shimmerTotalBalance():
      Column(
          children: [
            Container(
              height: 138,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: context.theme.colorScheme.primaryContainer,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15)),
                        child: SvgPicture.asset(
                          AssetSvgs.frameSmallIcon,
                        )),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15)),
                        child: SvgPicture.asset(AssetSvgs.frameIcon)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget(
                          "Total Balance",
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColor.whiteColor,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextWidget(
                          "\$ ${dashBoardController.getBalance.value}",
                          fontSize: 27,
                          fontWeight: FontWeight.w500,
                          color: AppColor.whiteColor,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const TextWidget(
                            "My Balances",
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColor.whiteColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: ShapeDecoration(
                                color: AppColor.whiteColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                shadows: [commonBoxshdow(blurRadius: 5)]),
                            child: RotatingIconButton(
                                onTap: (val) {
                                  dashBoardController.isBalanceDetail.value = val;
                                },
                                isShow: dashBoardController.isBalanceDetail.value,
                                borderRadius: 100.0,
                                rotateType: RotateType.semi,
                                clockwise: false,
                                background: AppColor.whiteColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  child: SvgPicture.asset(
                                    AssetSvgs.upDownIcon,
                                    color: AppColor.blackColor,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            if (!dashBoardController.isBalanceDetail.value)
              const SizedBox(
                height: 5,
              ),
            if (dashBoardController.isBalanceDetail.value)
              AnimationLimiter(
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dashBoardController.totalBalance.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 300),
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Container(
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
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            dashBoardController
                                                .bankImages[index].last,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            "${dashBoardController.totalBalance[index].title}",
                                            fontWeight: FontWeight.w600,
                                            color: context.theme.textTheme
                                                .titleMedium!.color,
                                            fontSize: 13.sp),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextWidget(
                                            "\$${dashBoardController.totalBalance[index].value}",
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.greenAssentColor,
                                            fontSize: 12.sp),
                                      ],
                                    ),
                                    const Spacer(),
                                    CupertinoSwitch(
                                      onChanged: (bool value) {
                                        setState(() {
                                          dashBoardController.totalBalance[index]
                                              .isTotalBalance = value;
                                          dashBoardController.getTotal();
                                        });
                                      },
                                      value: dashBoardController
                                          .totalBalance[index].isTotalBalance!,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            const SizedBox(
              height: 10,
            ),
          ],

      ),
    );
  }

  Widget _shimmerTotalBalance() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        children: [
          Container(
            height: 138,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
