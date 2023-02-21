import 'package:driver/feature/home_page/drivers_page/models/order_model/user_model.dart';

import '../../../create_order_page/models/city_model/city_details.dart';
import 'order_model.dart';

class OrderInfo {
  String? id;
  User? user;
  CityDetails? getCityFrom;
  String? addressFrom;
  CityDetails? getCityto;
  String? addressTo;
  int? price;
  String? note;
  String? date;
  String? createdAt;
  String? type;

  OrderInfo(
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

  OrderInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    getCityFrom = json['city_from'] != null
        ? CityDetails.fromJson(json['city_from'])
        : null;
    addressFrom = json['address_from'];
    getCityFrom = json['city_to'] != null
        ? new CityDetails.fromJson(json['city_to'])
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
