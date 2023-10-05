import 'package:budget_buddie/Data/Api/api_constants.dart';
import 'package:budget_buddie/Data/Api/api_manager.dart';
import 'package:budget_buddie/Data/Models/asset_model.dart';
import 'package:budget_buddie/Data/Models/liability_model.dart';

class EditNetWorthRepository {
  ApiManager apiManager = ApiManager();

  Future<AssetModel> getAssetList(String id,{bool isLoaderShow = true}) async {
    try {
      var response = await apiManager.get(
          APIConstants.getAsset + id, isErrorSnackShow: false,isLoaderShow: isLoaderShow);
      var responseMap = AssetModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }
  Future<LiabilityModel> getLiabilityList(String id,{bool isLoaderShow = true}) async {
    try {
      var response = await apiManager.get(
          APIConstants.getLiability + id, isErrorSnackShow: false,isLoaderShow: isLoaderShow);
      var responseMap = LiabilityModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

}