import 'package:dio/dio.dart';
import 'package:driver/feature/home_page/create_order_page/models/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core_data/consts_data/consts_data.dart';

class EditOredrRepo {
  final Dio dio;
  EditOredrRepo({required this.dio});

  Future<void> editOrder({
    required String id,
    required SendOrderModel model,
  }) async {
    await dio.put(
      'ride/orders/$id/',
      data: model.toJson(),
    );
  }

  Future<void> deleteOrder({
    required String id,
  }) async {
    await dio.delete(
      'ride/orders/$id/',
    );
  }
}
