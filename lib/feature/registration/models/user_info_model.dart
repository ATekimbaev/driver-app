class UserInfoModel {
  String? id;
  String? name;
  String? username;
  String? getAvatar;

  UserInfoModel({this.id, this.name, this.username, this.getAvatar});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    getAvatar = json['get_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['get_avatar'] = this.getAvatar;
    return data;
  }
}
