// ignore_for_file: library_private_types_in_public_api

import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_controller.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DragableListView extends StatefulWidget {
  // List<Map<Widget, String>> item = [
  //   {const Top5Expenses(): "Top 5 Expenses"},
  //   {const SpendvsBudget(): "Spend vs Budget"},
  //   {const SpendvsBudget(): "Transaction"},
  //   {const SpendvsBudget(): "Income vs Expenses Graph"},
  //   {const SpendvsBudget(): "Golas"},
  //   {const SpendvsBudget(): "Marchants"},
  //   {const SpendvsBudget(): "Account Balnces"},
  //   {const SpendvsBudget(): "Income vs Expenses"}
  // ];

  const DragableListView({super.key});
  @override
  _DragableListViewState createState() => _DragableListViewState();
}

class _DragableListViewState extends State<DragableListView> {
  DashBoardController dashBoardController = Get.find();

  void reorderData(int oldindex, int newindex) {
    if (newindex > oldindex) {
      newindex -= 1;
    }
    final items = dashBoardController.showWidgetsList.removeAt(oldindex);
    dashBoardController.showWidgetsList.insert(newindex, items);
  }

  @override
  void dispose() {
    dashBoardController.onDisposeUpdateList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: Obx(
        () => ReorderableListView(
          physics: const BouncingScrollPhysics(),
          onReorder: reorderData,
          children: [
            for (final items in dashBoardController.showWidgetsList)
              Column(
                key: ValueKey(items),
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (!dashBoardController.hideWidgetsList
                                .contains(items)) {
        dashBoardController.showWidgetsList.remove(items);
                            dashBoardController.hideWidgetsList.add(items);
                                }
                    
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            size: 30,
                            color: Colors.red,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      TextWidget(
                        items.keys.first,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: context.theme.textTheme.titleMedium!.color,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: context.theme.textTheme.titleMedium!.color,
                        ),
                      ),
                    ],
                  ),
                  const Divider()
                ],
              ),
          ],
        ),
      ),
    );
  }
}
