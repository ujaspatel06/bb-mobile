class CashAccountModel {
  List<Accounts>? accounts;

  CashAccountModel({this.accounts});

  CashAccountModel.fromJson(Map<String, dynamic> json) {
    if (json['accounts'] != null) {
      accounts = <Accounts>[];
      json['accounts'].forEach((v) {
        accounts!.add(Accounts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (accounts != null) {
      data['accounts'] = accounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Accounts {
  String? accountUuid;
  String? userUuid;
  String? accountName;
  int? value;
  String? avatar;
  String? updatedAt;

  Accounts(
      {this.accountUuid,
        this.userUuid,
        this.accountName,
        this.value,
        this.avatar,
        this.updatedAt});

  Accounts.fromJson(Map<String, dynamic> json) {
    accountUuid = json['accountUuid'];
    userUuid = json['userUuid'];
    accountName = json['accountName'];
    value = json['value'];
    avatar = json['avatar'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountUuid'] = accountUuid;
    data['userUuid'] = userUuid;
    data['accountName'] = accountName;
    data['value'] = value;
    data['avatar'] = avatar;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
