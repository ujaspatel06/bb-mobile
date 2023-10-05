import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/Components/reorderrable_listview.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FilerBottomSheet {
  static void showModalSheet(BuildContext context) {
    showModalBottomSheet(
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
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          "Edit widgets",
                          fontSize: 15.sp,
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
                      height: 20,
                    ),
                    const Expanded(child: DragableListView()),
                  ],
                ),
              ));
        });
  }
}
