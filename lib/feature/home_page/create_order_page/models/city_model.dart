class CityModel {
  int? page;
  int? totalPages;
  int? limit;
  int? totalCount;
  List<CityFrom>? cityFrom;

  CityModel(
      {this.page, this.totalPages, this.limit, this.totalCount, this.cityFrom});

  CityModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    limit = json['limit'];
    totalCount = json['total_count'];
    if (json['results'] != null) {
      cityFrom = <CityFrom>[];
      json['results'].forEach((v) {
        cityFrom!.add(new CityFrom.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_pages'] = this.totalPages;
    data['limit'] = this.limit;
    data['total_count'] = this.totalCount;
    if (this.cityFrom != null) {
      data['results'] = this.cityFrom!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityFrom {
  String? id;
  String? name;
  String? fullName;
  String? parent;
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
