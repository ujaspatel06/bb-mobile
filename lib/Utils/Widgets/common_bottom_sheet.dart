import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';



Future<void> commonModalSheet(BuildContext context,
    { String? title, Widget? child,double heigth = 1.5}) {
   return showModalBottomSheet(
        // transitionAnimationController: controller,
        context: context,
        backgroundColor: context.theme.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        isScrollControlled: true,
        isDismissible: true,
        useRootNavigator: true,
        builder: (builder) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / heigth,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            title??"",
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                            color: context.theme.textTheme.titleMedium!.color,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.close,
                              color: context.theme.textTheme.titleMedium!.color,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      child?? const SizedBox(),
                    ],
                  ),
                ),
              ));
        });
  }

