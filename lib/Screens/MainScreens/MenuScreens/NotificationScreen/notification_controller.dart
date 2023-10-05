import 'package:budget_buddie/Utils/constant.dart';
import 'package:budget_buddie/generated.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
//  List<Color> todayColor = [
//     AppColor.amberLightColor,
//     AppColor.fullLightGreenColor
//   ];

//   List<Color> yesterdayColor = [
//     AppColor.purpleLightColor,
//     AppColor.pinkLightColor,
//     AppColor.yellowLightColor,
//     AppColor.blueaccentLightColor
//   ];

  List todayNotification = [
    [AssetSvgs.groceryIcon, AppColor.amberLightColor, "Groceries"],
    [AssetSvgs.goalsIcon, AppColor.fullLightGreenColor, "Goals"],
  ];

  List yesterdayNotification = [
    [AssetSvgs.home, AppColor.purpleLightColor, "House"],
    [AssetSvgs.userMore, AppColor.pinkLightColor, "New Merchants"],
    [AssetSvgs.calendarIcon, AppColor.yellowLightColor, "Monthly digest"],
    [AssetSvgs.moneyIcon, AppColor.blueaccentLightColor, "Income vs Expenses"],
  ];

  RxString selectedType = 'All'.obs;

  RxList notificationType = [
    'All',
    'Groceries',
    'Goals',
    'House',
    'New Merchants',
    'Monthly digest',
    'Income vs Expenses'
  ].obs;
}
