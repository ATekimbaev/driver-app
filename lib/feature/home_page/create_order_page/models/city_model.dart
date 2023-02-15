class CityModel {
  int? page;
  int? totalPages;
  int? limit;
  int? totalCount;
  List<Results>? results;

  CityModel(
      {this.page, this.totalPages, this.limit, this.totalCount, this.results});

  CityModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? fullName;
  Results? parent;
  bool? isAvailableAsPoint;
  String? type;

  Results(
      {this.id,
      this.name,
      this.fullName,
      this.parent,
      this.isAvailableAsPoint,
      this.type});

  Results.fromJson(Map<String, dynamic> json) {
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
