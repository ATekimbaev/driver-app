part of 'get_drivers_order_bloc.dart';

@immutable
abstract class GetDriversOrderState {}

class GetDriversOrderInitial extends GetDriversOrderState {}

class GetDriversOrderSuccess extends GetDriversOrderState {
  final OrderModel model;
  GetDriversOrderSuccess({required this.model});
}

class GetPassengersOrderSuccess extends GetDriversOrderState {
  final OrderModel model;
  GetPassengersOrderSuccess({required this.model});
}

class GetAllOrderSuccess extends GetDriversOrderState {
  final OrderModel model;
  GetAllOrderSuccess({required this.model});
}

class GetDriversOrderError extends GetDriversOrderState {}
