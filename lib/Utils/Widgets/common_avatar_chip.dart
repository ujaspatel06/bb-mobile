import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/main.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommonAvatarChip extends StatelessWidget {
  const CommonAvatarChip({
    super.key,
    required this.title,
    required this.avatar,
  });

  final String title;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 2, right: 8, bottom: 2, top: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColor.greyColor),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(right: 5),
              padding: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: AppColor.pinkLightColor, shape: BoxShape.circle),
              child: TextWidget(
                avatar,
                fontSize: 11,
              )),
          TextWidget(
            title,
            color: box.read(GetStorageKey.themeMode) ?? false
                ? AppColor.greyColor
                : AppColor.textPrimaryColor,
            fontSize: 11.sp,
          ),
        ],
      ),
    );
  }
}
