import 'package:dio/dio.dart';
import 'package:driver/feature/home_page/create_order_page/models/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core /consts/consts_data.dart';

class EditOredrRepo {
  final Dio dio;
  EditOredrRepo({required this.dio});

  Future<void> editOrder({
    required String id,
    required SendOrderModel model,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await dio.put(
      'ride/orders/$id/',
      data: model.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer ${prefs.getString(AppConsts.accesToken)}',
        },
      ),
    );
  }

  Future<void> deleteOrder({
    required String id,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await dio.delete(
      'ride/orders/$id/',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${prefs.getString(AppConsts.accesToken)}',
        },
      ),
    );
  }
}
