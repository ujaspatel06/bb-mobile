class UserModel {
  int? userId;
  String? userUuid;
  String? username;
  String? token;

  UserModel({this.userId, this.userUuid, this.username, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userUuid = json['userUuid'];
    username = json['username'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userUuid'] = userUuid;
    data['username'] = username;
    data['token'] = token;
    return data;
  }
}
