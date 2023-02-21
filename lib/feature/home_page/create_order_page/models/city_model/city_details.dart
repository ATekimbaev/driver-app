class CityDetails {
  String? id;
  String? name;
  String? fullName;
  String? parent;
  bool? isAvailableAsPoint;
  String? type;

  CityDetails(
      {this.id,
      this.name,
      this.fullName,
      this.parent,
      this.isAvailableAsPoint,
      this.type});

  CityDetails.fromJson(Map<String, dynamic> json) {
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
