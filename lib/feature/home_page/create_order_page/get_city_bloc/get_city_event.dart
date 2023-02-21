part of 'get_city_bloc.dart';

@immutable
abstract class GetCityEvent {}

class GetCityListEvent extends GetCityEvent {
  final String? cityName;
  final int? page;
  GetCityListEvent({this.cityName, this.page});
}
