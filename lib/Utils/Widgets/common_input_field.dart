import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'box_shadow.dart';
import 'text_widget.dart';

class CommonFormField extends StatelessWidget {
  final String? label;
  final bool withAsterisk;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function()? onSuffixTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? stacIcon;
  final Widget? onlyStackIcon;
  final Widget? fileImage;
  final Color? lableColor;
  final Color? dropdownTextColor;
  final void Function()? onTap;
  final String? hintText;
  final Color? fillColor;
  final BuildContext context;
  final int flex1;
  final int flex2;
  final double horizontalPadding;
  final bool isDropDown;
  final bool isCommonContainer;
  final RxMap<String, String>? dropDownItems;
  final RxString? selectedItem;

  const CommonFormField(
      {Key? key,
      this.label,
      this.textInputType = TextInputType.text,
      this.withAsterisk = false,
      this.readOnly = false,
      this.obscureText = false,
      this.inputFormatters,
      this.controller,
      this.enabled = true,
      this.validator,
      this.onSuffixTap,
      this.suffixIcon,
      this.prefixIcon,
      this.lableColor,
      this.hintText,
      this.onTap,
      required this.context,
      this.flex1 = 1,
      this.flex2 = 1,
      this.isDropDown = false,
      this.dropDownItems,
      this.selectedItem,
      this.isCommonContainer = false,
      this.fillColor,
      this.stacIcon,
      this.fileImage,
      this.horizontalPadding = 12,
      this.dropdownTextColor,
      this.onlyStackIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle errorStyle = TextStyle(
        color: Colors.red.shade700,
        fontWeight: FontWeight.w600,
        fontSize: 11.5);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: isCommonContainer ? 7 : 12),
      alignment: Alignment.center,
      margin:
          isCommonContainer ? null : const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        boxShadow: isCommonContainer ? null : [commonBoxshdow()],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          prefixIcon ?? const SizedBox(),
          if (label != null)
            Expanded(
              flex: flex1,
              child: TextWidget(
                label!,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: lableColor ?? context.theme.textTheme.titleMedium!.color,
              ),
            ),
          const SizedBox(width: 5.0),
          Expanded(
            flex: flex2,
            child: !isDropDown
                ? onlyStackIcon ??
                    Stack(
                      children: [
                        TextFormField(
                          onTap: onTap,
                          readOnly: readOnly!,
                          enabled: enabled,
                          controller: controller,
                          cursorColor:
                              context.theme.textTheme.titleMedium!.color,
                          keyboardType: textInputType,
                          inputFormatters: inputFormatters,
                          obscureText: obscureText,
                          validator: validator,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: context.theme.textTheme.titleMedium!.color ??
                                AppColor.blackColor,
                          ),
                          decoration: InputDecoration(
                              errorStyle: errorStyle,
                              hintText: hintText ?? "",
                              filled: true,
                              isDense: true,
                              fillColor: fillColor ??
                                  context.theme.textTheme.labelLarge!.color,
                              hintStyle: TextStyle(
                                  color: context
                                      .theme.textTheme.titleMedium!.color!,
                                  fontSize: 14),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 11),
                              suffixIconConstraints: stacIcon != null
                                  ? const BoxConstraints(
                                      minHeight: 42, maxHeight: 42)
                                  : null,
                              suffixIcon:
                                  stacIcon != null ? const SizedBox() : null,
                              // constraints: const BoxConstraints(
                              //     minHeight: 40, maxHeight: 40),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none)),
                        ),
                        Align(
                                alignment: Alignment.center,
                                child: fileImage ?? const SizedBox())
                            .marginOnly(top: 6),
                        Align(
                            alignment: Alignment.centerRight,
                            child: stacIcon ?? const SizedBox()),
                      ],
                    )
                : FormField<String>(
                    validator: validator,
                    builder: (FormFieldState<String> state) {
                      //  This method checks if selected item is out of list or not ?

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputDecorator(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: fillColor ??
                                  context.theme.textTheme.labelLarge!.color,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              constraints: const BoxConstraints(
                                  maxHeight: 40, minHeight: 40),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                            ),
                            // isEmpty: _currentSelectedValue == '',
                            child: DropdownButtonHideUnderline(
                              child: Obx(
                                () => DropdownButton<String>(
                                  elevation: 0,
                                  value: selectedItem!.value.isEmpty
                                      ? null
                                      : (dropDownItems!.keys
                                              .contains(selectedItem?.value))
                                          ? selectedItem!.value
                                          : null,
                                  isDense: false,
                                  onTap: () {
                                    if (onTap != null) {
                                      onTap!();
                                    }
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: dropdownTextColor ??
                                        context
                                            .theme.textTheme.titleMedium!.color,
                                  ),
                                  onChanged: (String? newValue) {
                                    //   setState(() {
                                    selectedItem!.value = newValue!;
                                    if (onTap != null) {
                                      onTap!();
                                    }
                                    //     state.didChange(newValue);
                                    //   });
                                  },
                                  isExpanded: true,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: dropdownTextColor ??
                                        context
                                            .theme.textTheme.titleMedium!.color,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  items: dropDownItems!.entries.map((map) {
                                    return DropdownMenuItem<String>(
                                      value: map.key,
                                      alignment: AlignmentDirectional.center,
                                      child: Text(map.value, maxLines: 1),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          if (state.hasError)
                            Padding(
                              padding: const EdgeInsets.only(top: 6, left: 12),
                              child: Text(
                                state.errorText!,
                                textAlign: TextAlign.start,
                                style: errorStyle,
                              ),
                            )
                        ],
                      );
                    },
                  ),
          ),
          suffixIcon ?? const SizedBox(),
        ],
      ),
    );
  }
}
