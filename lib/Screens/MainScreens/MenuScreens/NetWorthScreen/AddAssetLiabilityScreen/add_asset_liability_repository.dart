import 'package:budget_buddie/Data/Api/api_constants.dart';
import 'package:budget_buddie/Data/Api/api_manager.dart';
import 'package:budget_buddie/Data/Models/common_msg_model.dart';

class AddAssetLiabilityRepository {
  ApiManager apiManager = ApiManager();

  // Asset

  Future<CommonMsgModel> addAsset(Map<String, String> parameters) async {
    try {
      var response = await apiManager.post(APIConstants.addAsset, parameters,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }


  Future<CommonMsgModel> updateAsset(Map<String, String> parameters) async {
    try {
      var response = await apiManager.put(APIConstants.updateAsset, parameters,
          isErrorSnackShow: false,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<CommonMsgModel> deleteAsset(String id) async {
    try {
      var response = await apiManager.delete(APIConstants.deleteAsset + id,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  // Liability

  Future<CommonMsgModel> addLiability(Map<String, String> parameters) async {
    try {
      var response = await apiManager.post(APIConstants.addLiability, parameters,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }


  Future<CommonMsgModel> updateLiability(Map<String, String> parameters) async {
    try {
      var response = await apiManager.put(APIConstants.updateLiability, parameters,
          isErrorSnackShow: false,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<CommonMsgModel> deleteLiability(String id) async {
    try {
      var response = await apiManager.delete(APIConstants.deleteLiability + id,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }
}
