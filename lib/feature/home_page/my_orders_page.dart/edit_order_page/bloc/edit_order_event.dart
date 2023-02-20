part of 'edit_order_bloc.dart';

@immutable
abstract class EditOrderEvent {}

class SendNewDataEvent extends EditOrderEvent {
  final SendOrderModel model;
  final String id;

  SendNewDataEvent({required this.model, required this.id});
}
