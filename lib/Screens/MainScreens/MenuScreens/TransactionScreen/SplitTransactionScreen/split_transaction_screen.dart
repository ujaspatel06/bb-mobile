// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Screens/MainScreens/MenuScreens/TransactionScreen/SplitTransactionScreen/split_transaction_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_appbar.dart';
import 'package:budget_buddie/Utils/Widgets/common_input_field.dart';
import 'package:budget_buddie/Utils/Widgets/custom_button.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplitTransactionScreen extends StatefulWidget {
  const SplitTransactionScreen({super.key});

  @override
  State<SplitTransactionScreen> createState() => _SplitTransactionScreenState();
}

class _SplitTransactionScreenState extends State<SplitTransactionScreen> {
  SplitTransactionController splitTransactionController =
      Get.put(SplitTransactionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          InkWell(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              AssetSvgs.closeIcon,
              color: context.theme.textTheme.titleMedium!.color,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
        ],
        titleWidget: TextWidget(
          "Split Transaction",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: context.theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [commonBoxshdow(blurRadius: 30)],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
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
                      child: TextWidget("Ami Insurance",
                          textAlign: TextAlign.start,
                          maxLine: 1,
                          fontWeight: FontWeight.w600,
                          color: context.theme.textTheme.titleMedium!.color,
                          fontSize: 12.sp),
                    ),
                    const SizedBox(width: 10),
                    TextWidget("-\$12.00",
                        fontWeight: FontWeight.w600,
                        color: AppColor.redColor,
                        fontSize: 12.sp),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  boxShadow: [commonBoxshdow()],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(children: [
                CommonFormField(
                  context: context,
                  label: '1st split amount',
                  isCommonContainer: true,
                ),
                CommonFormField(
                  context: context,
                  label: 'Category',

                  isCommonContainer: true,
                  isDropDown: true,
                  selectedItem: splitTransactionController.tempSelectedValue,
                  dropDownItems: splitTransactionController.tempItems,
                  // controller: grocerieBudgetController.tempController,
                  flex2: 2,
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  boxShadow: [commonBoxshdow()],
                  borderRadius: BorderRadius.circular(15)),
              child: Column(children: [
                CommonFormField(
                  context: context,
                  label: '2nd split amount',
                  isCommonContainer: true,
                ),
                CommonFormField(
                  context: context,
                  label: 'Category',

                  isCommonContainer: true,
                  isDropDown: true,
                  selectedItem: splitTransactionController.tempSelectedValue,
                  dropDownItems: splitTransactionController.tempItems,
                  // controller: grocerieBudgetController.tempController,
                  flex2: 2,
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  boxShadow: [commonBoxshdow()],
                  borderRadius: BorderRadius.circular(12)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.greenAssentColor),
                  child: const Icon(
                    Icons.add,
                    size: 22,
                    color: AppColor.whiteColor,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                TextWidget(
                  "Add another split",
                  fontSize: 11.sp,
                  color: context.theme.textTheme.titleMedium!.color,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  width: 15,
                ),
              ]),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              buttonText: 'Split Transaction',

              onBtnPress: () {},
              width: 16.w,
            ),
          ]),
        ),
      ),
    );
  }
}
