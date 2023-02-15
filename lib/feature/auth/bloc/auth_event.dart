part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LogInEvent extends AuthEvent {
  final String username;
  final String password;
  LogInEvent({required this.password, required this.username});
}
