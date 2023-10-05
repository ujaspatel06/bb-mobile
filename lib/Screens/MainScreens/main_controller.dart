import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt pageIndex = 0.obs;


  // final List<Widget> pages = [
  //   Navigator(
  //     key: Get.nestedKey(NestedKeys.dashBoardId),
  //     initialRoute: Routes.dashBoardScreen,
  //     onGenerateRoute: (settings) {
  //       if (settings.name == Routes.dashBoardScreen) {
  //         return GetPageRoute(
  //           settings: settings,
  //           page: () => const DashBoardScreen(),
  //         );
  //       } else if (settings.name == Routes.profileScreen) {
  //         return GetPageRoute(
  //           settings: settings,
  //           page: () => const ProfileScreen(),
  //         );
  //       } else if (settings.name == Routes.grocerieBudgetScreen) {
  //         return GetPageRoute(
  //           settings: settings,
  //           page: () => const GrocerieBudgetScreen(),
  //         );
  //       }
  //       return null;
  //     },
  //   ),
  //   const DashBoardScreen(),
  //   const DashBoardScreen(),
  //   Navigator(
  //     key: Get.nestedKey(NestedKeys.menuId),
  //     initialRoute: Routes.dashBoardScreen,
  //     onGenerateRoute: (settings) {
  //       if (settings.name == Routes.dashBoardScreen) {
  //         return GetPageRoute(
  //           settings: settings,
  //           page: () => const DashBoardScreen(),
  //         );
  //       } else if (settings.name == Routes.notificationScreen) {
  //         return GetPageRoute(
  //           settings: settings,
  //           page: () => const NotificationScreen(),
  //         );
  //       } else if (settings.name == Routes.profileScreen) {
  //         return GetPageRoute(
  //           settings: settings,
  //           page: () => const ProfileScreen(),
  //         );
  //       }
  //       return null;
  //     },
  //   ),
  // ];
}
