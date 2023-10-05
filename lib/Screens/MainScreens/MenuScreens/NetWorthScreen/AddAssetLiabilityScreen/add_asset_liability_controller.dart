// ignore_for_file: use_build_context_synchronously

import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/AddAssetLiabilityScreen/add_asset_liability_repository.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/net_worth_controller.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddAssetLiabilityController extends GetxController {
  RxString imageName = ''.obs;
  RxString imagePath = ''.obs;
  var isLoading = false.obs;
  NetWorthController netWorthController = Get.put(NetWorthController());

  TextEditingController addNameController = TextEditingController();
  TextEditingController addValueController = TextEditingController();
  TextEditingController addOwingAmountController = TextEditingController();

  // TextEditingController addImage = TextEditingController();

  final GlobalKey<FormState> addAssetFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addLiabilityFormKey = GlobalKey<FormState>();
  AddAssetLiabilityRepository addAssetLiabilityRepository =
      AddAssetLiabilityRepository();

// Assets

  addAsset(BuildContext context) async {
    if (addAssetFormKey.currentState!.validate() && !isLoading.value) {
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addAssetLiabilityRepository.addAsset({
          "userUuid": userInfo["userUuid"].toString(),
          "assetsName": addNameController.text,
          "value": addValueController.text,
          "amount": addOwingAmountController.text,
          "avatar": imageName.value,
        });
        if (response.code == 1) {
          await netWorthController.getAssetList(isLoaderShow: false);
          Navigator.pop(context);
          // SnackBars.successSnackBar(content: response.message!);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  updateAsset(BuildContext context, String id) async {
    if (addAssetFormKey.currentState!.validate() && !isLoading.value) {
      // TODO: INCOME ADD
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addAssetLiabilityRepository.updateAsset({
          "userUuid": userInfo["userUuid"].toString(),
          "assetsUuid": id,
          "assetsName": addNameController.text,
          "value": addValueController.text,
          "amount": addOwingAmountController.text,
          "avatar": imageName.value,
        });
        if (response.code == 1) {
          await netWorthController.getAssetList(isLoaderShow: false);
          Navigator.pop(context);
          // SnackBars.successSnackBar(content: response.message!);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> deleteAsset(BuildContext context, String id) async {
    if (!isLoading.value) {
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addAssetLiabilityRepository
            .deleteAsset('${userInfo["userUuid"].toString()}/$id');
        if (response.code == 1) {
          await netWorthController.getAssetList(isLoaderShow: false);
          Navigator.pop(context);
          // SnackBars.successSnackBar(content: response.message!);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");

        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  // Liability

  addLiability(BuildContext context) async {
    if (addLiabilityFormKey.currentState!.validate() && !isLoading.value) {
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addAssetLiabilityRepository.addLiability({
          "userUuid": userInfo["userUuid"].toString(),
          "liabilityName": addNameController.text,
          "value": addValueController.text,
          "assetsId": netWorthController.assetSelectedItem.value,
          "avatar": imageName.value,
        });
        if (response.code == 1) {
          await netWorthController.getLiabilityList(isLoaderShow: false);
          Navigator.pop(context);
          // SnackBars.successSnackBar(content: response.message!);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  updateLiability(BuildContext context, String id) async {
    if (addLiabilityFormKey.currentState!.validate() && !isLoading.value) {
      // TODO: INCOME ADD
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addAssetLiabilityRepository.updateLiability({
          "userUuid": userInfo["userUuid"].toString(),
          "liabilityUuid": id,
          "liabilityName": addNameController.text,
          "value": addValueController.text,
          "assetsId": netWorthController.assetSelectedItem.value,
          "avatar": imageName.value,
        });
        if (response.code == 1) {
          await netWorthController.getLiabilityList(isLoaderShow: false);
          Navigator.pop(context);
          // SnackBars.successSnackBar(content: response.message!);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> deleteLiability(BuildContext context, String id) async {
    if (!isLoading.value) {
      try {
        isLoading.value = true;
        var userInfo = GetStorage().read(GetStorageKey.USER_INFO) as Map;
        debugPrint('USER INFO :: $userInfo');

        var response = await addAssetLiabilityRepository
            .deleteLiability('${userInfo["userUuid"].toString()}/$id');
        if (response.code == 1) {
          await netWorthController.getLiabilityList(isLoaderShow: false);
          Navigator.pop(context);
          // SnackBars.successSnackBar(content: response.message!);
        }
      } catch (e) {
        debugPrint("::::::::::$e::::::::::");
        // rethrow;
      } finally {
        isLoading.value = false;
      }
    }
  }

  clearAssetLiabilityFields() {
    addNameController.clear();
    addValueController.clear();
    imageName.value = "";
    addOwingAmountController.clear();
  }
}
