import 'package:dio/dio.dart';
import 'package:driver/feature/home_page/create_order_page/models/order_model.dart';

class EditOredrRepo {
  final Dio dio;
  EditOredrRepo({required this.dio});

  Future<void> editOrder({
    required String id,
    required SendOrderModel model,
  }) async {
    await dio.put(
      'ride/orders/$id/',
      data: {
        model.toJson(),
      },
    );
  }
}
