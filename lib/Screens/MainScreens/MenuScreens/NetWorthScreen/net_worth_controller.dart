import 'package:budget_buddie/Data/Models/asset_model.dart';
import 'package:budget_buddie/Data/Models/liability_model.dart';
import 'package:budget_buddie/Screens/MainScreens/MenuScreens/NetWorthScreen/edit_net_worth_repository.dart';
import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NetWorthController extends GetxController {
  RxBool isBalanceDetail = false.obs;
  RxInt totalAssetValue = 0.obs;
  RxInt totalLiabilityValue = 0.obs;
  var isLoading = true.obs;

  RxList<Assets> assetList = <Assets>[].obs;
  RxList<Liability> liabilityList = <Liability>[].obs;
  RxMap<String, String> assetsItem = <String, String>{}.obs;
  RxString assetSelectedItem = "".obs;

  EditNetWorthRepository editNetWorthRepository = EditNetWorthRepository();

  @override
  void onInit() {
    // TODO: implement onInit
    getAssetList();
    getLiabilityList();
    super.onInit();
  }

  Future getAssetList({bool isLoaderShow = true}) async {
    try {
      isLoading.value = true;
      var token = GetStorage().read(GetStorageKey.USER_INFO) ?? '{}' as Map;
      assetList.clear();
      assetsItem.value = {};
      totalAssetValue.value = 0;
      var response = await editNetWorthRepository.getAssetList(
          token["userUuid"].toString(),
          isLoaderShow: isLoaderShow);

      if (response.assets != null) {
        List<Assets> assets = <Assets>[];
        assets.addAll(response.assets!);
        assetList.addAll(assets.reversed);

        for (var value in assetList) {
          totalAssetValue.value = (value.amount ?? 0) + totalAssetValue.value;

          assetsItem[value.assetsId!.toString()] = value.assetsName!;
        }
        assetSelectedItem.value = assetsItem.keys.first;
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    } finally {
      isLoading.value = false;
    }
  }

  Future getLiabilityList({bool isLoaderShow = true}) async {
    try {
      isLoading.value = true;
      var token = GetStorage().read(GetStorageKey.USER_INFO) ?? '{}' as Map;
      liabilityList.clear();
      totalLiabilityValue.value = 0;
      var response = await editNetWorthRepository.getLiabilityList(
          token["userUuid"].toString(),
          isLoaderShow: isLoaderShow);

      if (response.liability != null) {
        List<Liability> liability = <Liability>[];
        liability.addAll(response.liability!);
        liabilityList.addAll(liability.reversed);

        for (var value in liabilityList) {
          totalLiabilityValue.value =
              (value.value ?? 0) + totalLiabilityValue.value;
        }
      }
    } catch (e) {
      debugPrint("::::::::::$e::::::::::");
    } finally {
      isLoading.value = false;
    }
  }
}
