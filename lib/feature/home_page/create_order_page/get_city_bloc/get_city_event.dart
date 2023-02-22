part of 'get_city_bloc.dart';

@immutable
abstract class GetCityEvent {}

class GetCityListEvent extends GetCityEvent {
  final String cityName;
  final int? page;
  GetCityListEvent({required this.cityName, this.page});
}
