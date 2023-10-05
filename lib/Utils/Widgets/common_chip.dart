import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommonChip extends StatelessWidget {
  const CommonChip({super.key, required this.title, this.bgColor = SaprateLightDarkColor.greenLightColor});

  final String title;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
      decoration: ShapeDecoration(
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: TextWidget(
        title,
        color: AppColor.whiteColor,
        fontSize: 10.sp,
      ),
    );
  }
}
