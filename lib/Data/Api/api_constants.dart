class APIConstants {
  // ::::::::::::: Auth APIs ::::::::::::::::::::::::::

  static const String login = "api/developer-apis/clients/v1/user/login";
  static const String register = "api/developer-apis/clients/v1/user/signup";
  static const String changePassword =
      "api/developer-apis/clients/v1/user/changePassword";
  static const String forgotPassword =
      "api/developer-apis/clients/v1/user/forgotPassword";

  // :::::::: Income and Expense :::::::::::::::::::::::

  static const String addIncome = "api/developer-apis/v1/budgetSummary/incomes";
  static const String updateIncome =
      "api/developer-apis/v1/budgetSummary/updateIncome";
  static const String updateExpense =
      "api/developer-apis/v1/budgetSummary/updateExpenses";
  static const String deleteIncome =
      "api/developer-apis/v1/budgetSummary/incomes/";
  static const String deleteExpense =
      "api/developer-apis/v1/budgetSummary/expenses/";
  static const String addExpense =
      "api/developer-apis/v1/budgetSummary/addExpenses";
  static const String getIncomes =
      "api/developer-apis/v1/budgetSummary/incomes/";
  static const String getExpenses =
      "api/developer-apis/v1/budgetSummary/expenses/";

  //  ::::::::::::: Goals :::::::::::::::::::::::::::
  static const String getGoals = "api/developer-apis/goals/getGoals/";
  static const String addGoals = "api/developer-apis/goals/addGoals";
  static const String updateGoals = "api/developer-apis/goals/updateGoals";
  static const String deleteGoals = "api/developer-apis/goals/deleteGoals/";

  //  ::::::::::::: Asset and Liability  :::::::::::::  //
  static const String addAsset = "api/developer-apis/v1/networth/assets";
  static const String addLiability = "api/developer-apis/v1/networth/liability";
  static const String getAsset = "api/developer-apis/v1/networth/assets/";
  static const String updateAsset =
      "api/developer-apis/v1/networth/updateAssets";
  static const String deleteAsset = "api/developer-apis/v1/networth/assets/";
  static const String updateLiability =
      "api/developer-apis/v1/networth/updateLiability";
  static const String deleteLiability =
      "api/developer-apis/v1/networth/liability/";
  static const String getLiability =
      "api/developer-apis/v1/networth/liability/";

  // ::::::::::::::: Add cash account ::::::::::::::::::  //

  static const String updateCashAccount =
      "api/developer-apis/cashAccount/updateCashAccount";
  static const String getCashAccount =
      "api/developer-apis/cashAccount/getCashAccount/";
  static const String deleteCashAccount =
      "api/developer-apis/cashAccount/deleteCashAccount/";
  static const String addCashAccount =
      "api/developer-apis/cashAccount/addCashAccount";
}
