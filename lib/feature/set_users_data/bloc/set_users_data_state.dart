part of 'set_users_data_bloc.dart';

@immutable
abstract class SetUsersDataState {}

class SetUsersDataInitial extends SetUsersDataState {}

class SetUsersDataLoading extends SetUsersDataState {}

class SetUsersDataSucces extends SetUsersDataState {}

class SetUsersDataError extends SetUsersDataState {}
