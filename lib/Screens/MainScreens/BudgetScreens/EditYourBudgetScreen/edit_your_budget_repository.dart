import 'package:budget_buddie/Data/Api/api_constants.dart';
import 'package:budget_buddie/Data/Api/api_manager.dart';
import 'package:budget_buddie/Data/Models/expenses_model.dart';
import 'package:budget_buddie/Data/Models/incomes_model.dart';

class EditYourBudgetRepository {
  ApiManager apiManager = ApiManager();
  Future<IncomesModel> getIncomesList(String id,
      {bool isLoaderShow = false}) async {
    try {
      var response = await apiManager.get(APIConstants.getIncomes + id,
          isLoaderShow: isLoaderShow, isErrorSnackShow: isLoaderShow);
      var responseMap = IncomesModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }

  Future<ExpensesModel> getExpensesList(String id,
      {bool isLoaderShow = false}) async {
    try {
      var response = await apiManager.get(APIConstants.getExpenses + id,
          isLoaderShow: isLoaderShow, isErrorSnackShow: isLoaderShow);
      var responseMap = ExpensesModel.fromJson(response);
      return responseMap;
    } catch (e) {
      rethrow;
    }
  }
}
