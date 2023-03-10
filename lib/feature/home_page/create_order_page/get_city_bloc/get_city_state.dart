part of 'get_city_bloc.dart';

@immutable
abstract class GetCityState {}

class GetCityInitial extends GetCityState {}

class GetCityLoading extends GetCityState {}

class GetCitySucces extends GetCityState {
  final List<CityDetails> model;
  GetCitySucces({required this.model});
}

class GetCityError extends GetCityState {}
