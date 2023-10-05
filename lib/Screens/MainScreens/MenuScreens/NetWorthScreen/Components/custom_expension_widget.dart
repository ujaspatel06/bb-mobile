// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:budget_buddie/Routes/routes.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/AddAssetLiabilityScreen/add_asset_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/AddAssetLiabilityScreen/add_liability_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/net_worth_controller.dart';
import 'package:flutter/material.dart';

import 'package:budget_buddie/generated.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../Utils/constant.dart';
import '../../../../../Utils/Widgets/box_shadow.dart';
import '../../../../../Utils/Widgets/common_input_field.dart';
import '../../../../../Utils/Widgets/custom_rotation_icon.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    super.key,
    required this.lable,
    this.isLiabilities = false,
    required this.value,
    required this.image,
    this.owingAmount,
    this.linkToAsset,
    this.linkToAssetName,
    this.itemUuid,
  });

  final String? itemUuid;
  final String lable;
  final String value;
  final String image;
  final String? owingAmount;
  final String? linkToAsset;
  final String? linkToAssetName;

  final bool isLiabilities;

  // final int index;

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isExpanded = false;
  NetWorthController netWorthController = Get.put(NetWorthController());

  // ImagePicker picker = ImagePicker();
  // String imageName = '';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _toggleExpansion() {
    setState(() {
      if (_isExpanded) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: context.theme.primaryColor,
          boxShadow: [commonBoxshdow()],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          CommonFormField(
            context: context,
            readOnly: true,
            label: widget.lable,
            flex1: 3,
            hintText: widget.value,
            isCommonContainer: true,
            flex2: 5,
            suffixIcon: RotatingIconButton(
                onTap: (val) {
                  _toggleExpansion();
                },
                isShow: _isExpanded,
                borderRadius: 100.0,
                rotateType: RotateType.semi,
                clockwise: false,
                background: _isExpanded
                    ? AppColor.greenAssentColor
                    : Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: SvgPicture.asset(
                    AssetSvgs.upDownIcon,
                    color: _isExpanded
                        ? AppColor.whiteColor
                        : context.theme.textTheme.titleMedium!.color,
                  ),
                )).marginOnly(left: 5),
          ),
          SizeTransition(
            sizeFactor: _animation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonFormField(
                  context: context,
                  label: 'Image',
                  flex1: 1,
                  hintText: widget.image,
                  readOnly: true,
                  isCommonContainer: true,
                  // stacIcon: IconButton(
                  //     constraints:
                  //         const BoxConstraints(maxHeight: 35, minHeight: 35),
                  //     onPressed: pickImage,
                  //     icon: const Icon(Icons.file_upload_outlined)),
                  flex2: 3,
                ),
                if (!widget.isLiabilities) ...[
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  //   child: TextWidget("Have a liability to add for this asset?",
                  //       fontWeight: FontWeight.w500,
                  //       color: context.theme.textTheme.titleMedium!.color,
                  //       fontSize: 12.sp),
                  // ),
                  CommonFormField(
                    context: context,
                    label: 'Owing amount',
                    flex1: 2,
                    textInputType: TextInputType.number,
                    readOnly: true,
                    hintText: "\$${widget.owingAmount}",
                    suffixIcon: InkWell(
                      onTap: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings:
                              const RouteSettings(name: Routes.addAssetScreen),
                          screen: AddAssetScreen(
                            isEdit: true,
                            assetAmount: widget.owingAmount,
                            assetName: widget.lable,
                            assetImage: widget.image,
                            assetValue: widget.value,
                            assetUuid: widget.itemUuid,
                          ),
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.greenAssentColor),
                        child: const Icon(Icons.arrow_forward_ios_rounded,
                            size: 20, color: AppColor.whiteColor),
                      ).marginOnly(left: 6),
                    ),
                    isCommonContainer: true,
                    flex2: 3,
                  ),
                ] else ...[
                  CommonFormField(
                    context: context,
                    label: 'Link to an asset',
                    readOnly: true,
                    hintText: widget.linkToAssetName??'',
                    suffixIcon: InkWell(
                      onTap: () {
                        PersistentNavBarNavigator
                            .pushNewScreenWithRouteSettings(
                          context,
                          settings: const RouteSettings(
                              name: Routes.addLiablityScreen),
                          screen: AddLiabilityScreen(
                            isEdit: true,
                            liabilityUuid: widget.itemUuid,
                            liabilityName: widget.lable,
                            liabilityValue: widget.value,
                            liabilityImage: widget.image,
                            linkToAsset: widget.linkToAsset,
                          ),
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.greenAssentColor),
                        child: const Icon(Icons.arrow_forward_ios_rounded,
                            size: 20, color: AppColor.whiteColor),
                      ).marginOnly(left: 6),
                    ),
                    flex1: 2,
                    isCommonContainer: true,
                    flex2: 3,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

// pickImage() async {
//   final XFile? pickedImage =
//       await picker.pickImage(source: ImageSource.gallery);
//
//   if (pickedImage != null) {
//     setState(() {
//       imageName = pickedImage.name;
//     });
//   }
// }
}
