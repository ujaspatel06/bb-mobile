import 'package:budget_buddie/Data/Api/api_constants.dart';
import 'package:budget_buddie/Data/Api/api_manager.dart';
import 'package:budget_buddie/Data/Models/common_msg_model.dart';

class AddIncomeExpenseRepository {
  ApiManager apiManager = ApiManager();
  Future<CommonMsgModel> addIncome(Map<String, String> parameters) async {
    try {
      var response = await apiManager.post(APIConstants.addIncome, parameters,
          isErrorSnackShow: false,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<CommonMsgModel> updateIncome(Map<String, String> parameters) async {
    try {
      var response = await apiManager.put(APIConstants.updateIncome, parameters,
          isErrorSnackShow: false,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<CommonMsgModel> deleteIncome(String id) async {
    try {
      var response = await apiManager.delete(APIConstants.deleteIncome + id,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<CommonMsgModel> addExpense(Map<String, String> parameters) async {
    try {
      var response = await apiManager.post(APIConstants.addExpense, parameters,
          isErrorSnackShow: false,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<CommonMsgModel> updateExpense(Map<String, String> parameters) async {
    try {
      var response = await apiManager
          .put(APIConstants.updateExpense, parameters, isErrorSnackShow: false,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<CommonMsgModel> deleteExpense(String id) async {
    try {
      var response = await apiManager.delete(APIConstants.deleteExpense + id,isLoaderShow: false);
      var responseMap = CommonMsgModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }
}
