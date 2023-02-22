import 'package:bloc/bloc.dart';
import 'package:driver/feature/registration/repositories/registration_repository.dart';
import 'package:driver/feature/set_users_data/repositories/set_user_data_repository.dart';
import 'package:meta/meta.dart';

import '../../../registration/models/user_info_model.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required this.repo}) : super(SettingsInitial()) {
    on<GetUserInfoEvent>((event, emit) async {
      try {
        final model = await repo.getMe();
        emit(SettingsSuccess(model: model));
      } catch (e) {
        emit(SettingsError());
      }
    });
  }
  final RegistrationRepository repo;
}
