part of 'set_users_data_bloc.dart';

@immutable
abstract class SetUsersDataEvent {}

class SendDataEvent extends SetUsersDataEvent {
  final String password;
  final String login;
  SendDataEvent({required this.password, required this.login});
}
