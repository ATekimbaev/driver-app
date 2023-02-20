class OrderModel {
  int? page;
  int? totalPages;
  int? limit;
  int? totalCount;
  List<UserInfo>? userInfo;

  OrderModel(
      {this.page, this.totalPages, this.limit, this.totalCount, this.userInfo});

  OrderModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    limit = json['limit'];
    totalCount = json['total_count'];
    if (json['results'] != null) {
      userInfo = <UserInfo>[];
      json['results'].forEach((v) {
        userInfo!.add(new UserInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_pages'] = this.totalPages;
    data['limit'] = this.limit;
    data['total_count'] = this.totalCount;
    if (this.userInfo != null) {
      data['results'] = this.userInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserInfo {
  String? id;
  User? user;
  GetCityFrom? getCityFrom;
  String? addressFrom;
  GetCityFrom? getCityto;
  String? addressTo;
  int? price;
  String? note;
  String? date;
  String? createdAt;
  String? type;

  UserInfo(
      {this.id,
      this.user,
      this.getCityFrom,
      this.addressFrom,
      this.getCityto,
      this.addressTo,
      this.price,
      this.note,
      this.date,
      this.createdAt});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    getCityFrom = json['city_from'] != null
        ? new GetCityFrom.fromJson(json['city_from'])
        : null;
    addressFrom = json['address_from'];
    getCityFrom = json['city_to'] != null
        ? new GetCityFrom.fromJson(json['city_to'])
        : null;
    addressTo = json['address_to'];
    price = json['price'];
    note = json['note'];
    date = json['date'];
    createdAt = json['created_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.getCityFrom != null) {
      data['city_from'] = this.getCityFrom!.toJson();
    }
    data['address_from'] = this.addressFrom;
    if (this.getCityto != null) {
      data['city_to'] = this.getCityto!.toJson();
    }
    data['address_to'] = this.addressTo;
    data['price'] = this.price;
    data['note'] = this.note;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['type'] = this.type;
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? avatar;

  User({this.id, this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
}

class GetCityFrom {
  String? id;
  String? name;
  String? fullName;
  String? parent;
  bool? isAvailableAsPoint;
  String? type;

  GetCityFrom(
      {this.id,
      this.name,
      this.fullName,
      this.parent,
      this.isAvailableAsPoint,
      this.type});

  GetCityFrom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    parent = json['parent'];
    isAvailableAsPoint = json['is_available_as_point'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    data['parent'] = this.parent;
    data['is_available_as_point'] = this.isAvailableAsPoint;
    data['type'] = this.type;
    return data;
  }
}
