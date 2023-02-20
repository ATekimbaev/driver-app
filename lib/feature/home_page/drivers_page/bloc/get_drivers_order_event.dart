part of 'get_drivers_order_bloc.dart';

@immutable
abstract class GetDriversOrderEvent {}

class GetNewDriversOrderEvent extends GetDriversOrderEvent {}

class GetNewPassengersOrderEvent extends GetDriversOrderEvent {}

class GetAllOrdersEvent extends GetDriversOrderEvent {}
