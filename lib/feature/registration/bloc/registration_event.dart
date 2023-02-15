part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class SendCodeEvent extends RegistrationEvent {
  String otp;
  SendCodeEvent({required this.otp});
}
