import 'package:driver/feature/home_page/create_order_page/models/city_model/city_details.dart';
import 'package:driver/feature/home_page/drivers_page/models/order_model/user_info.dart';

class OrderModel {
  int? page;
  int? totalPages;
  int? limit;
  int? totalCount;
  List<OrderInfo>? orderInfo;

  OrderModel(
      {this.page,
      this.totalPages,
      this.limit,
      this.totalCount,
      this.orderInfo});

  OrderModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    limit = json['limit'];
    totalCount = json['total_count'];
    if (json['results'] != null) {
      orderInfo = <OrderInfo>[];
      json['results'].forEach((v) {
        orderInfo!.add(new OrderInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_pages'] = this.totalPages;
    data['limit'] = this.limit;
    data['total_count'] = this.totalCount;
    if (this.orderInfo != null) {
      data['results'] = this.orderInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
