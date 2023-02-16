part of 'create_order_bloc.dart';

@immutable
abstract class CreateOrderState {}

class CreateOrderInitial extends CreateOrderState {}

class CreateOrderSuccess extends CreateOrderState {}

class CreateOrderError extends CreateOrderState {
  String errorMessage;
  CreateOrderError({required this.errorMessage});
}
