part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSucces extends RegistrationState {
  final TokenModel model;
  RegistrationSucces({required this.model});
}

class RegistrationError extends RegistrationState {}
