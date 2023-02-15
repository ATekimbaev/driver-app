import 'package:bloc/bloc.dart';
import 'package:driver/feature/registration/models/token_model.dart';
import 'package:driver/feature/registration/repositories/registration_repository.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({required this.repository}) : super(RegistrationInitial()) {
    on<SendCodeEvent>(
      (event, emit) async {
        emit(RegistrationLoading());
        try {
          final model = await repository.registration(otp: event.otp);

          emit(RegistrationSucces(model: model));
        } catch (e) {
          emit(RegistrationError());
        }
      },
    );
  }
  final RegistrationRepository repository;
}
