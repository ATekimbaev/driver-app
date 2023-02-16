part of 'get_city_bloc.dart';

@immutable
abstract class GetCityState {}

class GetCityInitial extends GetCityState {}

class GetCitySucces extends GetCityState {
  final CityModel model;
  GetCitySucces({required this.model});
}

class GetCityError extends GetCityState {}
