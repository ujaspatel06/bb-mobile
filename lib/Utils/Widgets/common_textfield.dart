import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'text_widget.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool withAsterisk;
  final TextEditingController? controller;
  final TextEditingController? controllerPhone;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool obscureText;
  final bool isPhone;
  final String? Function(String?)? validator;
  final void Function()? onSuffixTap;
  final void Function(dynamic)? onChange;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color borderColor;

  const CustomTextField({
    Key? key,
    required this.label,
    this.hint = '',
    this.textInputType = TextInputType.text,
    this.withAsterisk = false,
    this.obscureText = false,
    this.inputFormatters,
    this.controller,
    this.controllerPhone,
    this.enabled = true,
    this.validator,
    this.onSuffixTap,
    this.onChange,
    this.suffixIcon,
    this.prefixIcon,
    this.borderColor = Colors.transparent,
    this.isPhone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [commonBoxshdow()],
              color: AppColor.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                label,
                color: AppColor.greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              TextFormField(
                onChanged: (val) {
                  if (onChange != null) {
                    onChange!(val);
                  }
                },
                enabled: enabled,
                controller: controller,
                cursorColor: AppColor.blackColor,
                keyboardType: textInputType,
                inputFormatters: inputFormatters,
                validator: validator,
                obscureText: obscureText,
                style:
                    const TextStyle(color: AppColor.blackColor, fontSize: 16),
                decoration: InputDecoration(
                    isDense: true,
                    hintText: hint,
                    // filled: true,
                    // isDense: true,
                    // fillColor: AppColor.whiteColor,
                    hintStyle: const TextStyle(
                        color: AppColor.blackColor, fontSize: 16),
                    // constraints:
                    //     const BoxConstraints(maxHeight: 20, minHeight: 20),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none),
              ),
            ],
          ),
        ),
        Positioned(right: 25, child: suffixIcon ?? const SizedBox())
      ],
    );
  }
}

class CustomFormField extends StatelessWidget {
  final String label;
  final String hint;
  final bool withAsterisk;
  final TextEditingController? controller;
  final TextEditingController? controllerPhone;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool obscureText;

  final String? Function(String?)? validator;
  final void Function()? onSuffixTap;
  final void Function(dynamic)? onChange;
  final Widget? suffixIcon;
  final Color borderColor;

  const CustomFormField({
    Key? key,
    required this.label,
    this.hint = '',
    this.textInputType = TextInputType.text,
    this.withAsterisk = false,
    this.obscureText = false,
    this.inputFormatters,
    this.controller,
    this.controllerPhone,
    this.enabled = true,
    this.validator,
    this.onSuffixTap,
    this.onChange,
    this.suffixIcon,
    this.borderColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          label,
          color: context.textTheme.displayLarge!.color!,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
            onChanged: (val) {
              if (onChange != null) {
                onChange!(val);
              }
            },
            enabled: enabled,
            controller: controller,
            cursorColor: context.theme.primaryColor,
            keyboardType: textInputType,
            inputFormatters: inputFormatters,
            validator: validator,
            obscureText: obscureText,
            style: TextStyle(color: context.theme.hintColor, fontSize: 11.5.sp),
            decoration: InputDecoration(
              isDense: false,
              hintText: hint,
              // filled: true,
              // isDense: true,
              // fillColor: AppColor.whiteColor,
              hintStyle:
                  TextStyle(color: context.theme.hintColor, fontSize: 11.5.sp),
              suffixIcon: suffixIcon ?? const Text(""),
              suffixIconConstraints:
                  const BoxConstraints(maxHeight: 25, maxWidth: 30),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: context.theme.hintColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: context.theme.primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: context.theme.hintColor, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: context.theme.unselectedWidgetColor, width: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: context.theme.colorScheme.error, width: 1.2),
                borderRadius: BorderRadius.circular(15),
              ),
            )),
      ],
    );
  }
}
