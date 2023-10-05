import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constant.dart';
import 'text_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.borderRadius = 10,
      required this.buttonText,
      this.height = 45,
      this.width = 100.0,
      this.backgroundColor = AppColor.buttonGreenColor,
      this.textColor = AppColor.whiteColor,
      this.fontSize,
      required this.onBtnPress,
      this.borderColor,
      this.fontWeight = FontWeight.w600,
      this.widget,
      this.isShadow = true})
      : super(key: key);
  final double borderRadius;
  final String buttonText;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double? fontSize;
  final Function onBtnPress;
  final FontWeight fontWeight;
  final Widget? widget;
  final bool isShadow;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          onBtnPress();
        },
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: height,
          width: (width * MediaQuery.of(context).size.width) / 100,
          decoration: BoxDecoration(
              boxShadow: [
                isShadow == false ? const BoxShadow() : commonBoxshdow()
              ],
              color: backgroundColor,
              border:
                  Border.all(width: 2, color: borderColor ?? backgroundColor),
              borderRadius: BorderRadius.circular(borderRadius)),
          child: Stack(
            children: [
              Center(
                child: widget ??
                    TextWidget(
                      buttonText,
                      color: textColor,
                      fontSize: fontSize ?? 12.sp,
                      fontWeight: fontWeight,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key,
      required this.buttonText,
      this.textColor = AppColor.blueColor,
      this.fontSize,
      required this.onBtnPress,
      this.fontWeight = FontWeight.w700,
      this.widget})
      : super(key: key);
  final String buttonText;
  final Color textColor;
  final double? fontSize;
  final Function onBtnPress;
  final FontWeight fontWeight;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onBtnPress();
        // print("object");
      },
      child: Center(
          child: widget ??
              TextWidget(
                buttonText,
                color: textColor,
                fontSize: fontSize ?? 15.sp,
                fontWeight: fontWeight,
              )),
    );
  }
}
