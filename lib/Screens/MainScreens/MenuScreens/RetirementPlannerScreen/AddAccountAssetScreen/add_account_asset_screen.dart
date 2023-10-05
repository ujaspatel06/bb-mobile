import 'package:budget_buddie/Screens/MainScreens/MenuScreens/RetirementPlannerScreen/retirement_planner_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Utils/Widgets/text_widget.dart';

class AddAccountAssetScreen extends StatefulWidget {
  const AddAccountAssetScreen({super.key});

  @override
  State<AddAccountAssetScreen> createState() => _AddAccountAssetScreenState();
}

class _AddAccountAssetScreenState extends State<AddAccountAssetScreen> {
  RetirementPlannerController retirementPlannerController =
      Get.put(RetirementPlannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          IconButton(
              onPressed: () {
                // retirementPlannerController.saveAccountData();
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: context.theme.textTheme.titleMedium!.color,
              ))
        ],
        titleWidget: TextWidget(
          "Add an account",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget("Your accounts",
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 16.sp),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        retirementPlannerController.yourAccountData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
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
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                          maxLine: 1,
                                          textAlign: TextAlign.start,
                                          retirementPlannerController
                                              .yourAccountData[index].title!,
                                          fontWeight: FontWeight.w600,
                                          color: context.theme.textTheme
                                              .titleMedium!.color,
                                          fontSize: 13.sp),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextWidget("+\$3052.00",
                                          fontWeight: FontWeight.w600,
                                          maxLine: 1,
                                          textAlign: TextAlign.start,
                                          color: AppColor.greenAssentColor,
                                          fontSize: 10.sp),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CupertinoSwitch(
                                  onChanged: (val) {
                                    setState(() {
                                      retirementPlannerController
                                          .yourAccountData[index]
                                          .isSwitched = val;
                                      retirementPlannerController
                                              .accountAssetDataList.value =
                                          retirementPlannerController
                                              .yourAccountData
                                              .where(
                                                  (e) => e.isSwitched == true)
                                              .toList();
                                      // if (val == true) {
                                      //   // if (!retirementPlannerController
                                      //   //     .yourAccountData
                                      //   //     .contains(AccountItem(
                                      //   //         title:
                                      //   //             retirementPlannerController
                                      //   //                 .yourAccountData[index]
                                      //   //                 .title))) {
                                      //     retirementPlannerController
                                      //         .accountAssetDataList
                                      //         .add(AccountItem(
                                      //             title:
                                      //                 retirementPlannerController
                                      //                     .yourAccountData[
                                      //                         index]
                                      //                     .title));
                                      //   // }
                                      // } else {

                                      //   retirementPlannerController
                                      //       .yourAccountData
                                      //       .remove(AccountItem(
                                      //           title:
                                      //               retirementPlannerController
                                      //                   .yourAccountData[index]
                                      //                   .title));
                                      // }
                                    });
                                  },
                                  value: retirementPlannerController
                                      .yourAccountData[index].isSwitched!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 40,
                ),
                TextWidget("Your assets",
                    fontWeight: FontWeight.w700,
                    color: context.theme.textTheme.titleMedium!.color,
                    fontSize: 16.sp),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: retirementPlannerController.yourAssetData.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
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
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            maxLine: 1,
                                            textAlign: TextAlign.start,
                                            retirementPlannerController
                                                .yourAssetData[index].title!,
                                            fontWeight: FontWeight.w600,
                                            color: context.theme.textTheme
                                                .titleMedium!.color,
                                            fontSize: 13.sp),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextWidget("Value: \$5000",
                                            maxLine: 1,
                                            textAlign: TextAlign.start,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.greenAssentColor,
                                            fontSize: 10.sp),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CupertinoSwitch(
                                    onChanged: (val) {
                                      setState(() {
                                        retirementPlannerController
                                            .yourAssetData[index]
                                            .isSwitched = val;

                                        retirementPlannerController
                                                .accountAssetDataList2.value =
                                            retirementPlannerController
                                                .yourAssetData
                                                .where(
                                                    (e) => e.isSwitched == true)
                                                .toList();
                                      });
                                    },
                                    value: retirementPlannerController
                                        .yourAssetData[index].isSwitched!,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
