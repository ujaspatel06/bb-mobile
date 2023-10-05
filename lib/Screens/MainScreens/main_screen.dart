// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:budget_buddie/Screens/MainScreens/BudgetScreens/Components/budget_summary_tab_bar_view.dart';
import 'package:budget_buddie/Screens/MainScreens/DashBoardScreen/dashboard_screen.dart';
import 'package:budget_buddie/Screens/MainScreens/MerchantScreen/merchant_screen.dart';
import 'package:budget_buddie/Utils/Widgets/text_widget.dart';
import 'package:budget_buddie/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';

import 'MenuScreens/menu_screen.dart';
import 'main_controller.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainController mainController = Get.find();

  PersistentTabController? controller;

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetSvgs.homeIcon,
              color: mainController.pageIndex.value == 0
                  ? Color(0xFF469B88)
                  : context.theme.textTheme.titleMedium!.color,
            ),
            TextWidget(
              "Home",
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
              color: mainController.pageIndex.value == 0
                  ? Color(0xFF469B88)
                  : context.theme.textTheme.titleMedium!.color,
            ),
          ],
        ),
        // title: ("Home"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetSvgs.budgetIcon,
              color: mainController.pageIndex.value == 1
                  ? Color(0xFF469B88)
                  : context.theme.textTheme.titleMedium!.color,
            ),
            SizedBox(
              height: 4,
            ),
            TextWidget(
              "Budget",
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
              color: mainController.pageIndex.value == 1
                  ? Color(0xFF469B88)
                  : context.theme.textTheme.titleMedium!.color,
            ),
          ],
        ),
        // title: ("Budget"),
        iconSize: 35,
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetSvgs.userMore,
              color: mainController.pageIndex.value == 2
                  ? Color(0xFF469B88)
                  : context.theme.textTheme.titleMedium!.color,
            ),
            TextWidget(
              "Merchants",
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
              color: mainController.pageIndex.value == 2
                  ? Color(0xFF469B88)
                  : context.theme.textTheme.titleMedium!.color,
            ),
          ],
        ),
        // title: ("Merchants"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetSvgs.menuIcon,
              color: mainController.pageIndex.value == 3
                  ? Color(0xFF469B88)
                  : context.theme.textTheme.titleMedium!.color,
            ),
            TextWidget(
              "Menu",
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
              color: mainController.pageIndex.value == 3
                  ? Color(0xFF469B88)
                  : context.theme.textTheme.titleMedium!.color,
            ),
          ],
        ),
        // title: ("Menu"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(AssetPngs.tabLightContainer), context);
    precacheImage(const AssetImage(AssetPngs.tabDarkContainer), context);
    return bottomBar();
  }

  List<Widget> pages = [
    DashBoardScreen(),
    BudgetTabBarView(),
    MerchantScreen(),
    MenuScreen()
  ];

  Widget bottomBar() {
    controller = PersistentTabController(initialIndex: 0);
    return Obx(
      () => PersistentTabView(
        context,
        screens: pages,
        items: _navBarsItems(),
        controller: controller,
        // bottomScreenMargin: 0,
        popAllScreensOnTapAnyTabs: true,
        backgroundColor: context.theme.primaryColor,
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(20.0),
            colorBehindNavBar: context.theme.primaryColor),
        navBarHeight: 70,
        onItemSelected: (value) {
          mainController.pageIndex.value = value;
        },
        popActionScreens: PopActionScreensType.all,
        navBarStyle: NavBarStyle.style12,
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(
//         () => IndexedStack(
//             index: mainController.pageIndex.value, children: pages),
//       ),
//       bottomNavigationBar: buildMyNavBar(context),
//     );
//   }

//   Container buildMyNavBar(BuildContext context) {
//     return Container(
//       height: 80,
//       decoration: BoxDecoration(
//         color: context.theme.primaryColor,
//         boxShadow: [commonBoxshdow()],
//         border: isDarkMode == true
//             ? Border.all(color: Colors.transparent)
//             : Border.all(color: Color(0xffEBEBEB)),
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Obx(
//         () => Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             InkWell(
//               onTap: () {
//                 mainController.pageIndex.value = 0;
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     AssetSvgs.homeIcon,
//                     color: mainController.pageIndex.value == 0
//                         ? Color(0xFF469B88)
//                         : context.theme.textTheme.titleMedium!.color,
//                   ),
//                   TextWidget(
//                     "Home",
//                     fontSize: 8.sp,
//                     fontWeight: FontWeight.w500,
//                     color: mainController.pageIndex.value == 0
//                         ? Color(0xFF469B88)
//                         : context.theme.textTheme.titleMedium!.color,
//                   ),
//                 ],
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 mainController.pageIndex.value = 1;
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     AssetSvgs.budgetIcon,
//                     color: mainController.pageIndex.value == 1
//                         ? Color(0xFF469B88)
//                         : context.theme.textTheme.titleMedium!.color,
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   TextWidget(
//                     "Budget",
//                     fontSize: 8.sp,
//                     fontWeight: FontWeight.w500,
//                     color: mainController.pageIndex.value == 1
//                         ? Color(0xFF469B88)
//                         : context.theme.textTheme.titleMedium!.color,
//                   ),
//                 ],
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 mainController.pageIndex.value = 2;
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     AssetSvgs.userMore,
//                     color: mainController.pageIndex.value == 2
//                         ? Color(0xFF469B88)
//                         : context.theme.textTheme.titleMedium!.color,
//                   ),
//                   TextWidget(
//                     "Merchants",
//                     fontSize: 8.sp,
//                     fontWeight: FontWeight.w500,
//                     color: mainController.pageIndex.value == 2
//                         ? Color(0xFF469B88)
//                         : context.theme.textTheme.titleMedium!.color,
//                   ),
//                 ],
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 mainController.pageIndex.value = 3;
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     AssetSvgs.menuIcon,
//                     color: mainController.pageIndex.value == 3
//                         ? Color(0xFF469B88)
//                         : context.theme.textTheme.titleMedium!.color,
//                   ),
//                   TextWidget(
//                     "Menu",
//                     fontSize: 8.sp,
//                     fontWeight: FontWeight.w500,
//                     color: mainController.pageIndex.value == 3
//                         ? Color(0xFF469B88)
//                         : context.theme.textTheme.titleMedium!.color,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
