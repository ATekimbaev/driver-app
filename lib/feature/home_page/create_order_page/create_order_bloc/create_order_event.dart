part of 'create_order_bloc.dart';

@immutable
abstract class CreateOrderEvent {}

class CreateNewOrederEvent extends CreateOrderEvent {
  final SendOrderModel model;
  CreateNewOrederEvent({required this.model});
}
