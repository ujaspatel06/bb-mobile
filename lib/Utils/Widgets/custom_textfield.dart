import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget customCardTextField(
    {TextEditingController? controller,
    Widget? suffixIcon,
    double? borderRadius,
    TextInputType? textInputType,
    bool? isObsecure,
    ValueChanged<String?>? onChanged,
    List<BoxShadow>? boxShadow,
    required Color decorationColor,
    required Color textColor,
    required Color cursorColor,
    required Color hintColor,
    final String? Function(String?)? validator}) {
  return Container(
    // height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius ?? 5),
      boxShadow: boxShadow,
      color: decorationColor,
    ),
    child: Stack(
      alignment: Alignment.centerRight,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w500, fontSize: 12.sp),
            cursorColor: cursorColor,
            obscureText: isObsecure ?? false,
            validator: validator,
            keyboardType: textInputType,
            decoration: InputDecoration(
                isDense: true,
                hintText: "",
                // constraints: BoxConstraints(maxHeight: 25, minHeight: 25),
                hintStyle: TextStyle(color: hintColor, fontSize: 16),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none),
          ),
        ),
        suffixIcon ?? const SizedBox()
      ],
    ),
  );
}
