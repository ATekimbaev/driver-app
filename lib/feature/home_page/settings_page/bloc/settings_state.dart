part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsError extends SettingsState {}

class SettingsSuccess extends SettingsState {
  final UserInfoModel model;
  SettingsSuccess({required this.model});
}
