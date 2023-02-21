import 'package:dio/dio.dart';
import 'package:driver/feature/home_page/create_order_page/models/city_model/city_model.dart';

class GetCityRepo {
  final Dio dio;

  GetCityRepo({required this.dio});

  Future<CityModel> getCityList(String? cityName, int? page) async {
    final response = await dio.get(
      'ride/cities/',
      queryParameters: {
        'name': cityName ?? '',
        'page': page ?? '1',
      },
    );

    return CityModel.fromJson(response.data);
  }
}
