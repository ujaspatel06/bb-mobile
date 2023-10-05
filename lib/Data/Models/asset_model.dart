class AssetModel {
  List<Assets>? assets;

  AssetModel({this.assets});

  AssetModel.fromJson(Map<String, dynamic> json) {
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(Assets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (assets != null) {
      data['assets'] = assets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assets {
  String? assetsUuid;
  int? assetsId;
  String? userUuid;
  String? assetsName;
  int? value;
  int? amount;
  String? avatar;
  String? updatedAt;

  Assets(
      {this.assetsUuid,
        this.assetsId,
        this.userUuid,
        this.assetsName,
        this.value,
        this.amount,
        this.avatar,
        this.updatedAt});

  Assets.fromJson(Map<String, dynamic> json) {
    assetsUuid = json['assetsUuid'];
    assetsId = json['assetsId'];
    userUuid = json['userUuid'];
    assetsName = json['assetsName'];
    value = json['value'];
    amount = json['amount'];
    avatar = json['avatar'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assetsUuid'] = assetsUuid;
    data['assetsId'] = assetsId;
    data['userUuid'] = userUuid;
    data['assetsName'] = assetsName;
    data['value'] = value;
    data['amount'] = amount;
    data['avatar'] = avatar;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
