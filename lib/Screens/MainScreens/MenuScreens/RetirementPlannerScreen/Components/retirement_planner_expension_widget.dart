// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:budget_buddie/Utils/Widgets/custom_rotation_icon.dart';
import 'package:flutter/material.dart';

import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Utils/constant.dart';
import '../../../../../Utils/Widgets/box_shadow.dart';

class RetirementExpensionTile extends StatefulWidget {
  const RetirementExpensionTile(
      {super.key,
      required this.lable,
      this.isLiabilities = false,
      required this.downWidget,
      required this.imagePath,
      this.upWidget,
      this.onTap});
  final String lable;
  final bool isLiabilities;
  final Widget downWidget;
  final Widget? upWidget;
  final void Function(bool)? onTap;


  final String imagePath;

  @override
  _RetirementExpensionTileState createState() =>
      _RetirementExpensionTileState();
}

class _RetirementExpensionTileState extends State<RetirementExpensionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isExpanded = false;

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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: context.theme.primaryColor,
          boxShadow: [commonBoxshdow()],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            children: [
              widget.upWidget ??
                  Row(
                    children: [
                      Container(
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey.shade100,
                          image: DecorationImage(
                            image: AssetImage(
                              widget.imagePath,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      TextWidget(widget.lable,
                          fontWeight: FontWeight.w600,
                          color: context.theme.textTheme.titleMedium!.color,
                          fontSize: 13.sp),
                    ],
                  ),
              const Spacer(),
              RotatingIconButton(
                  onTap: (val) {
                    _toggleExpansion();
                    if (widget.onTap != null) {
                      widget.onTap!(val);
                    }
                  },
                  isShow: _isExpanded,
                  borderRadius: 100.0,
                  rotateType: RotateType.semi,
                  clockwise: false,
                  background: _isExpanded
                      ? AppColor.greenAssentColor
                      : Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: SvgPicture.asset(
                      AssetSvgs.upDownIcon,
                      color: _isExpanded
                          ? AppColor.whiteColor
                          : context.theme.textTheme.titleMedium!.color,
                    ),
                  )).marginOnly(left: 5),
            ],
          ),
          SizeTransition(sizeFactor: _animation, child: widget.downWidget),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
