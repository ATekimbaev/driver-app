import 'package:dio/dio.dart';
import 'package:driver/feature/home_page/drivers_page/models/order_model/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core_data/consts_data/consts_data.dart';

class GetOrederRepository {
  final Dio dio;
  GetOrederRepository({required this.dio});

  Future<OrderModel> getDriversOrder() async {
    final response = await dio.get(
      'ride/orders/drivers/',
    );

    return OrderModel.fromJson(response.data);
  }

  Future<OrderModel> getPassangersOrder() async {
    final response = await dio.get(
      'ride/orders/passengers/',
    );

    return OrderModel.fromJson(response.data);
  }

  Future<OrderModel> getAllOrders() async {
    final response = await dio.get(
      'ride/orders/',
    );

    return OrderModel.fromJson(response.data);
  }
}
