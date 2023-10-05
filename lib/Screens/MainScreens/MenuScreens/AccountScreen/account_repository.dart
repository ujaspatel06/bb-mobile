import 'package:budget_buddie/Data/Api/api_constants.dart';
import 'package:budget_buddie/Data/Api/api_manager.dart';
import 'package:budget_buddie/Data/Models/cash_account_model.dart';

class AccountRepository {
  ApiManager apiManager = ApiManager();

  Future<CashAccountModel> getCashAccount(String id,{bool isLoaderShow = true}) async {
    try {
      var response = await apiManager.get(
          APIConstants.getCashAccount + id, isErrorSnackShow: false,isLoaderShow: isLoaderShow);
      var responseMap = CashAccountModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

}