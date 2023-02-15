import 'package:bloc/bloc.dart';
import 'package:driver/feature/auth/repository/auth_repository.dart';
import 'package:driver/feature/registration/models/token_model.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LogInEvent>(
      (event, emit) async {
        try {
          await repository.getToken(
            password: event.password,
            username: event.username,
          );
          emit(AuthSucces());
        } catch (e) {
          emit(AuthError());
        }
      },
    );
  }
  final AuthRepository repository;
}
