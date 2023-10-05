import 'package:budget_buddie/Screens/Registration/AddPayment/addpayment_controller.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

Widget customCardTextField({
  String title = "",
  int? maxLength,
  bool isInputFormater = false,
  bool isExpiredate = false,
  TextEditingController? controller,
  Widget? suffixIcon,
}) {
  return Stack(
    alignment: Alignment.centerRight,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            title,
            color: Colors.grey,
            fontSize: 12.sp,
          ),
          TextFormField(
            inputFormatters: isInputFormater == false
                ? null
                : isExpiredate == true
                    ? [
                        LengthLimitingTextInputFormatter(maxLength),
                        FilteringTextInputFormatter.digitsOnly,
                        CardExpireDateFormatter(),
                      ]
                    : [
                        LengthLimitingTextInputFormatter(maxLength),
                        FilteringTextInputFormatter.digitsOnly,
                        CardNumberFormatter(),
                      ],
            controller: controller,
            style: TextStyle(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp),
            cursorColor: AppColor.blackColor,
            decoration: const InputDecoration(
                isDense: true,
                hintText: "",
                hintStyle: TextStyle(color: AppColor.blackColor, fontSize: 16),
                border: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(),
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
      suffixIcon ?? const SizedBox()
    ],
  );
}
