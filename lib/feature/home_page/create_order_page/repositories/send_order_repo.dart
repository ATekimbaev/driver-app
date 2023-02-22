import 'package:dio/dio.dart';
import 'package:driver/core_data/consts_data/consts_data.dart';
import 'package:driver/feature/home_page/create_order_page/models/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendOrderRepository {
  final Dio dio;

  SendOrderRepository({required this.dio});

  Future<void> sendNewOrder({required SendOrderModel model}) async {
    final prefs = await SharedPreferences.getInstance();
    await dio.post(
      'ride/orders/',
      data: model.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer ${prefs.getString(AppConsts.accesToken)}',
        },
      ),
    );
  }
}
