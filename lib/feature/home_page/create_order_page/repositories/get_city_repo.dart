import 'package:dio/dio.dart';
import 'package:driver/feature/home_page/create_order_page/models/city_model.dart';

class GetCityRepo {
  final Dio dio;

  GetCityRepo({required this.dio});

  Future<CityModel> getCityList(String? cityName) async {
    final response = await dio.get(
      'ride/cities/',
      queryParameters: {'name': cityName ?? ''},
    );

    return CityModel.fromJson(response.data);
  }
}
