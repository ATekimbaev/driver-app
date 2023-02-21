import 'city_details.dart';

class CityModel {
  int? page;
  int? totalPages;
  int? limit;
  int? totalCount;
  List<CityDetails>? cityDetails;

  CityModel(
      {this.page,
      this.totalPages,
      this.limit,
      this.totalCount,
      this.cityDetails});

  CityModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    limit = json['limit'];
    totalCount = json['total_count'];
    if (json['results'] != null) {
      cityDetails = <CityDetails>[];
      json['results'].forEach((v) {
        cityDetails!.add(CityDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_pages'] = this.totalPages;
    data['limit'] = this.limit;
    data['total_count'] = this.totalCount;
    if (this.cityDetails != null) {
      data['results'] = this.cityDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
