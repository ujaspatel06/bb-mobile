class IncomesModel {
  List<Incomes>? incomes;

  IncomesModel({this.incomes});

  IncomesModel.fromJson(Map<String, dynamic> json) {
    if (json['incomes'] != null) {
      incomes = <Incomes>[];
      json['incomes'].forEach((v) {
        incomes!.add(Incomes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (incomes != null) {
      data['incomes'] = incomes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Incomes {
  String? incomeUuid;
  String? userUuid;
  String? incomeType;
  String? incomeName;
  int? incomeAmount;
  String? lastPaymentDate;
  String? howOften;
  String? accountAssociated;
  String? updatedAt;

  Incomes(
      {this.incomeUuid,
      this.userUuid,
      this.incomeType,
      this.incomeName,
      this.incomeAmount,
      this.lastPaymentDate,
      this.howOften,
      this.accountAssociated,
      this.updatedAt});

  Incomes.fromJson(Map<String, dynamic> json) {
    incomeUuid = json['incomeUuid'];
    userUuid = json['userUuid'];
    incomeType = json['incomeType'];
    incomeName = json['incomeName'];
    incomeAmount = json['incomeAmount'];
    lastPaymentDate = json['lastPaymentDate'];
    howOften = json['howOften'];
    accountAssociated = json['accountAssociated'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['incomeUuid'] = incomeUuid;
    data['userUuid'] = userUuid;
    data['incomeType'] = incomeType;
    data['incomeName'] = incomeName;
    data['incomeAmount'] = incomeAmount;
    data['lastPaymentDate'] = lastPaymentDate;
    data['howOften'] = howOften;
    data['accountAssociated'] = accountAssociated;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
