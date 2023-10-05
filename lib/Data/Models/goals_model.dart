// ignore_for_file: unnecessary_this, prefer_collection_literals

class GoalsModel {
  List<Goals>? goals;

  GoalsModel({this.goals});

  GoalsModel.fromJson(Map<String, dynamic> json) {
    if (json['goals'] != null) {
      goals = <Goals>[];
      json['goals'].forEach((v) {
        goals!.add(Goals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.goals != null) {
      data['goals'] = this.goals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Goals {
  String? goalUuid;
  String? userUuid;
  String? goalName;
  int? value;
  int? contribution;
  String? howOften;
  String? accountUuid;
  String? colour;
  String? icon;
  String? updatedAt;

  Goals(
      {this.goalUuid,
      this.userUuid,
      this.goalName,
      this.value,
      this.contribution,
      this.howOften,
      this.accountUuid,
      this.colour,
      this.icon,
      this.updatedAt});

  Goals.fromJson(Map<String, dynamic> json) {
    goalUuid = json['goalUuid'];
    userUuid = json['userUuid'];
    goalName = json['goalName'];
    value = json['value'];
    contribution = json['contribution'];
    howOften = json['howOften'];
    accountUuid = json['accountUuid'].toString();
    colour = json['colour'];
    icon = json['icon'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['goalUuid'] = this.goalUuid;
    data['userUuid'] = this.userUuid;
    data['goalName'] = this.goalName;
    data['value'] = this.value;
    data['contribution'] = this.contribution;
    data['howOften'] = this.howOften;
    data['accountUuid'] = this.accountUuid;
    data['colour'] = this.colour;
    data['icon'] = this.icon;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
