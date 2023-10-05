import 'package:budget_buddie/Utils/Widgets/box_shadow.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CommonAccountDetailContainer extends StatelessWidget {
  const CommonAccountDetailContainer(
      {super.key,
      this.accountName,
      this.accountBalance,
      this.accountNum,
      this.userName,
      this.imagePath});

  final String? accountName;
  final String? accountBalance;
  final String? accountNum;
  final String? userName;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 180,
      width: 320,
      decoration: BoxDecoration(
        boxShadow: [commonBoxshdow(blurRadius: 8)],
        borderRadius: BorderRadius.circular(15),
        color: context.theme.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      accountName!,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget(
                      accountBalance!,
                      color: context.theme.textTheme.titleMedium!.color,
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                    height: 55,
                    width: 55,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: context.theme.canvasColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.asset(imagePath!)),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  "Account number",
                  color: context.theme.textTheme.titleMedium!.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  accountNum!,
                  color: context.theme.textTheme.titleMedium!.color,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          const Spacer(),
          Container(
            height: 50,
            width: 320,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              color: AppColor.darkBlueColor,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(
                    "Name",
                    color: AppColor.whiteColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  TextWidget(
                    userName!,
                    color: AppColor.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
