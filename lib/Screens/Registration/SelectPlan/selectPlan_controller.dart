// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'Revenucat/components/native_dialog.dart';

class SelectPlanController extends GetxController {
  RxBool selectPlanSwitch = true.obs;
  RxString planGroupValue = "".obs;
  String entitlementProID = 'pro_new';
  String entitlementStdID = 'std_new';
  RxString entitlementID = 'pro_new'.obs;

  RxList<Package> availablePackages = <Package>[].obs;

  @override
  void onInit() {
    getOffers();
    super.onInit();
  }

  void getOffers() async {
    // debugPrint("::::::: ${entitlementID.value} ::::::::");
    // setState(() {
    //   _isLoading = true;
    // });

    CustomerInfo customerInfo = await Purchases.getCustomerInfo();

    // if (customerInfo.activeSubscriptions.isNotEmpty) {
    //   debugPrint("Perchased");
    // } else {
    //   debugPrint("NOO Perchased");
    Offerings? offerings;
    try {
      offerings = await Purchases.getOfferings();
      // Default2 is for professional Plans
      // Default is for Standard Plans
      if (selectPlanSwitch.isTrue) {
        // Last is for year
        Package? stdYear =
            offerings.getOffering("default")?.availablePackages.last;
        // Last is for year
        Package? proYear =
            offerings.getOffering("default2")?.availablePackages.last;

        availablePackages.value = [stdYear!, proYear!];
      } else {
        // First is for month
        Package? stdMonth =
            offerings.getOffering("default")?.availablePackages.first;
        // First is for month
        Package? proMonth =
            offerings.getOffering("default2")?.availablePackages.first;
        availablePackages.value = [stdMonth!, proMonth!];
      }
      // debugPrint('------------');
      // debugPrint(availablePackages.first.storeProduct.priceString);
      // debugPrint('------------');
    } on PlatformException catch (e) {
      await showDialog(
          context: Get.context!,
          builder: (BuildContext context) => ShowDialogToDismiss(
              title: "Error",
              content: e.message ?? "Unknown error",
              buttonText: 'OK'));
    }

    // setState(() {
    //   _isLoading = false;
    // });
    // debugPrint(offerings!.all);
    // debugPrint(offerings.current!.availablePackages);
    //
    // if (offerings == null || offerings.current == null) {
    //   // offerings are empty, show a message to your user
    // } else {
    //   // current offering is available, show paywall
    //   availablePackages.value = offerings.current!.availablePackages;
    // }
    // }
  }

  purchasePlan() async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    // if (customerInfo.activeSubscriptions.isEmpty) {
    Package package;
    if (planGroupValue.value == 'Pro') {
      package = availablePackages.last;
    } else {
      package = availablePackages.first;
    }
    try {
      CustomerInfo customerInfo = await Purchases.purchasePackage(package);
      // EntitlementInfo? entitlement =
      //     customerInfo.entitlements.all[entitlementID];
      // appData.entitlementIsActive = entitlement?.isActive ?? false;
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    }
    // }
  }
}
