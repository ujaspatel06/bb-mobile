// ignore_for_file: file_names

import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:sizer/sizer.dart';

class CommonContainer {
  static Widget commonMenuScreenContainer(
      BuildContext context, String imagePath, String title) {
    return Container(
      padding: const EdgeInsets.only(left: 14, top: 7, bottom: 7),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: context.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [commonBoxshdow(blurRadius: 30)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 43,
                width: 43,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(imagePath))),
              ),
              SizedBox(
                width: 5.w,
              ),
              TextWidget(title,
                  fontWeight: FontWeight.w600,
                  color: context.theme.textTheme.titleMedium!.color,
                  fontSize: 13.sp),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColor.greyColor,
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
