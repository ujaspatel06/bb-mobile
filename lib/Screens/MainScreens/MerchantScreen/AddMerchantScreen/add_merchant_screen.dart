import 'package:budget_buddie/Screens/MainScreens/MerchantScreen/merchant_controller.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/common_notification_icon.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/common_appbar.dart';

class AddMerchantScreen extends StatefulWidget {
  const AddMerchantScreen({super.key});

  @override
  State<AddMerchantScreen> createState() => _AddMerchantScreenState();
}

class _AddMerchantScreenState extends State<AddMerchantScreen> {
  MerchantController merchantController = Get.put(MerchantController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: customAppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: context.theme.textTheme.titleMedium!.color,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          InkWell(
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                Navigator.pop(context);
              },
              child: const CommonNotificationIcon()),
          const SizedBox(
            width: 14,
          ),
        ],
        titleWidget: TextWidget(
          "Add Merchants",
          color: context.theme.textTheme.titleMedium!.color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                "Add a Merchants",
                color: context.theme.textTheme.titleMedium!.color,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 1.h,
              ),
              ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: merchantController.merchantList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(8),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: context.theme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: [commonBoxshdow(blurRadius: 30)],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 46,
                              width: 46,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueGrey.shade100,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    merchantController.merchantsImages[index],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                      merchantController.merchantList[index].first,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.start,
                                      maxLine: 1,
                                      color: context
                                          .theme.textTheme.titleMedium!.color,
                                      fontSize: 13.sp),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
               SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
