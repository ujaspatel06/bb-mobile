import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Screens/MainScreens/MerchantScreen/MerchnatDetails/merchant_details_screen.dart';
import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../../Utils/Widgets/common_chip.dart';

class Merchants extends StatefulWidget {
  const Merchants({super.key});

  @override
  State<Merchants> createState() => _MerchantsState();
}

class _MerchantsState extends State<Merchants> {
  DashBoardController dashBoardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return isLoading?_shimmerMerchants():Column(
      children: [
        Row(
          children: [
            TextWidget(
              "Merchants",
              fontSize: 16.sp,
              color: context.theme.textTheme.titleMedium!.color,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            if (!dashBoardController.isWidegetHide("Merchants"))
              InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                      context,
                      settings: const RouteSettings(
                          name: Routes.merchnatDetailScreen),
                      screen: const MerchantDetailsScreen(),
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                  child: const CommonChip(title: "See all")),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 7),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: box.read(GetStorageKey.themeMode) ?? false
                ? SaprateLightDarkColor.redColor
                : SaprateLightDarkColor.pinkLightColor,
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
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AssetPngs.uncategoryMerchant,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              TextWidget("Uncategorised Merchants",
                  fontWeight: FontWeight.w600,
                  color: AppColor.whiteColor,
                  fontSize: 13.sp),
              const Spacer(),
              TextWidget("5",
                  fontWeight: FontWeight.w600,
                  color: AppColor.whiteColor,
                  fontSize: 12.sp),
            ],
          ),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 7),
          decoration: ShapeDecoration(
            color: box.read(GetStorageKey.themeMode) ?? false
                ? SaprateLightDarkColor.cyanColor
                : SaprateLightDarkColor.greenLightColor,
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
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AssetPngs.categoryMerchant,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              TextWidget("Categorised Merchants",
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                  fontSize: 13.sp),
              const Spacer(),
              TextWidget("57",
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                  fontSize: 12.sp),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _shimmerMerchants() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
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
