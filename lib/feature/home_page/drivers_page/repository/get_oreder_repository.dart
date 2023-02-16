import 'package:dio/dio.dart';
import 'package:driver/feature/home_page/drivers_page/models/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core /consts/consts.dart';

class GetOrederRepository {
  final Dio dio;
  GetOrederRepository({required this.dio});

  Future<OrderModel> getDriversOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final response = await dio.get(
      'ride/orders/drivers/',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${prefs.getString(AppConsts.accesToken)}',
        },
      ),
    );

    return OrderModel.fromJson(response.data);
  }
}
