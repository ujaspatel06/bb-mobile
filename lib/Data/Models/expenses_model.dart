class ExpensesModel {
  List<Expenses>? expenses;

  ExpensesModel({this.expenses});

  ExpensesModel.fromJson(Map<String, dynamic> json) {
    if (json['expenses'] != null) {
      expenses = <Expenses>[];
      json['expenses'].forEach((v) {
        expenses!.add(Expenses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (expenses != null) {
      data['expenses'] = expenses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Expenses {
  String? expenseUuid;
  String? userUuid;
  String? expenseType;
  int? expenseAmount;
  String? lastPaymentDate;
  String? howOften;
  String? accountAssociated;
  String? updatedAt;

  Expenses(
      {this.expenseUuid,
      this.userUuid,
      this.expenseType,
      this.expenseAmount,
      this.lastPaymentDate,
      this.howOften,
      this.accountAssociated,
      this.updatedAt});

  Expenses.fromJson(Map<String, dynamic> json) {
    expenseUuid = json['expenseUuid'];
    userUuid = json['userUuid'];
    expenseType = json['expenseType'];
    expenseAmount = json['expenseAmount'];
    lastPaymentDate = json['lastPaymentDate'];
    howOften = json['howOften'];
    accountAssociated = json['accountAssociated'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expenseUuid'] = expenseUuid;
    data['userUuid'] = userUuid;
    data['expenseType'] = expenseType;
    data['expenseAmount'] = expenseAmount;
    data['lastPaymentDate'] = lastPaymentDate;
    data['howOften'] = howOften;
    data['accountAssociated'] = accountAssociated;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
