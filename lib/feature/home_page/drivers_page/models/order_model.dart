class OrderModel {
  int? page;
  int? totalPages;
  int? limit;
  int? totalCount;
  List<Results>? results;

  OrderModel(
      {this.page, this.totalPages, this.limit, this.totalCount, this.results});

  OrderModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    limit = json['limit'];
    totalCount = json['total_count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_pages'] = this.totalPages;
    data['limit'] = this.limit;
    data['total_count'] = this.totalCount;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  User? user;
  CityFrom? cityFrom;
  String? addressFrom;
  CityFrom? cityTo;
  String? addressTo;
  int? price;
  String? note;
  String? date;
  String? createdAt;

  Results(
      {this.id,
      this.user,
      this.cityFrom,
      this.addressFrom,
      this.cityTo,
      this.addressTo,
      this.price,
      this.note,
      this.date,
      this.createdAt});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    cityFrom = json['city_from'] != null
        ? new CityFrom.fromJson(json['city_from'])
        : null;
    addressFrom = json['address_from'];
    cityTo =
        json['city_to'] != null ? new CityFrom.fromJson(json['city_to']) : null;
    addressTo = json['address_to'];
    price = json['price'];
    note = json['note'];
    date = json['date'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.cityFrom != null) {
      data['city_from'] = this.cityFrom!.toJson();
    }
    data['address_from'] = this.addressFrom;
    if (this.cityTo != null) {
      data['city_to'] = this.cityTo!.toJson();
    }
    data['address_to'] = this.addressTo;
    data['price'] = this.price;
    data['note'] = this.note;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
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

class CityFrom {
  String? id;
  String? name;
  String? fullName;
  Null? parent;
  bool? isAvailableAsPoint;
  String? type;

  CityFrom(
      {this.id,
      this.name,
      this.fullName,
      this.parent,
      this.isAvailableAsPoint,
      this.type});

  CityFrom.fromJson(Map<String, dynamic> json) {
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
