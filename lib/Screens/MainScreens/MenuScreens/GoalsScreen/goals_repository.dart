import 'package:budget_buddie/Data/Api/api_constants.dart';
import 'package:budget_buddie/Data/Api/api_manager.dart';
import 'package:budget_buddie/Data/Models/common_msg_model.dart';
import 'package:budget_buddie/Data/Models/goals_model.dart';

class GoalsRepository {
  ApiManager apiManager = ApiManager();
  Future<GoalsModel> getGoalsList(String id, {bool isLoaderShow = true}) async {
    try {
      var response = await apiManager.get(APIConstants.getGoals + id,
          isLoaderShow: isLoaderShow, isErrorSnackShow: isLoaderShow);
      var responseMap = GoalsModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<CommonMsgModel> addGoals(Map<String, String> parameters) async {
    try {
      var response = await apiManager.post(APIConstants.addGoals, parameters,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<CommonMsgModel> updateGoals(Map<String, String> parameters) async {
    try {
      var response = await apiManager.put(APIConstants.updateGoals, parameters,
          isErrorSnackShow: false,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<CommonMsgModel> deleteGoals(String id) async {
    try {
      var response = await apiManager.delete(APIConstants.deleteGoals + id,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }
}
