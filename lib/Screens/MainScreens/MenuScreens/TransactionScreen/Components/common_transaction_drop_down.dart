import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CommonDropDown extends StatelessWidget {
  final void Function()? onTap;

  final Color? fillColor;
  final BuildContext context;

  final double horizontalPadding;
  final bool isDropDown;
  final bool isCommonContainer;
  final RxMap<String, String>? dropDownItems;
  final RxString? selectedItem;

  const CommonDropDown(
      {Key? key,
      this.onTap,
      required this.context,
      this.isDropDown = false,
      this.dropDownItems,
      this.selectedItem,
      this.isCommonContainer = false,
      this.fillColor,
      this.horizontalPadding = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: isCommonContainer ? 7 : 12),
      decoration: BoxDecoration(
          color: context.theme.primaryColor,
          boxShadow: isCommonContainer ? null : [commonBoxshdow()],
          borderRadius: BorderRadius.circular(15)),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? context.theme.textTheme.labelLarge!.color,
              constraints: const BoxConstraints(maxHeight: 30, minHeight: 30),
              contentPadding: const EdgeInsets.all(5),
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
            ),
            // isEmpty: _currentSelectedValue == '',
            child: DropdownButtonHideUnderline(
              child: Obx(
                () => DropdownButton<String>(
                  value: selectedItem!.value,
                  isDense: false,
                  onTap: () {
                    if (onTap != null) {
                      onTap!();
                    }
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: context.theme.textTheme.titleMedium!.color!,
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
                  elevation: 0,
                  iconSize: 18,
                  // isExpanded: true,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
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
          );
        },
      ),
    );
  }
}
