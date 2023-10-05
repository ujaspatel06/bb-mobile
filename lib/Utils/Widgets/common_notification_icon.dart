// ignore_for_file: deprecated_member_use

import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class CommonNotificationIcon extends StatelessWidget {
  const CommonNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 7, left: 7),
          child: SvgPicture.asset(
            AssetSvgs.notificationIcon,
            color: context.theme.textTheme.titleMedium!.color,
          ),
        ),
        Container(
          height: 10,
          width: 10,
          margin: const EdgeInsets.only(bottom: 12, left: 10),
          decoration: BoxDecoration(
            color: AppColor.redColor,
            shape: BoxShape.circle,
            border: Border.all(
                width: 2, color: context.theme.scaffoldBackgroundColor),
          ),
        )
      ],
    );
  }
}
