class LiabilityModel {
  List<Liability>? liability;

  LiabilityModel({this.liability});

  LiabilityModel.fromJson(Map<String, dynamic> json) {
    if (json['liability'] != null) {
      liability = <Liability>[];
      json['liability'].forEach((v) {
        liability!.add(Liability.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (liability != null) {
      data['liability'] = liability!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Liability {
  String? userUuid;
  String? liabilityUuid;
  String? liabilityName;
  int? value;
  String? avatar;
  int? assetsId;
  String? updatedAt;

  Liability(
      {this.userUuid,
      this.liabilityUuid,
      this.liabilityName,
      this.value,
      this.avatar,
      this.assetsId,
      this.updatedAt});

  Liability.fromJson(Map<String, dynamic> json) {
    userUuid = json['userUuid'];
    liabilityUuid = json['liabilityUuid'];
    liabilityName = json['liabilityName'];
    value = json['value'];
    avatar = json['avatar'];
    assetsId = json['assetsId'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userUuid'] = userUuid;
    data['liabilityUuid'] = liabilityUuid;
    data['liabilityName'] = liabilityName;
    data['value'] = value;
    data['avatar'] = avatar;
    data['assetsId'] = assetsId;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
