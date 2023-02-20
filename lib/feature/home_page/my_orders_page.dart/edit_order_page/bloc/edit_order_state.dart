part of 'edit_order_bloc.dart';

@immutable
abstract class EditOrderState {}

class EditOrderInitial extends EditOrderState {}

class EditOrderSucces extends EditOrderState {}

class EditOrderError extends EditOrderState {}
