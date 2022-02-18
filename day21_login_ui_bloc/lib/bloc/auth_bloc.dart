import 'package:bloc/bloc.dart';
import 'package:day21_login_ui_bloc/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'form_state.dart';

class AuthBloc extends Bloc<AuthEvent, LoginState> {
  final AuthRepository authRepo;

  AuthBloc({required this.authRepo}) : super(LoginState()) {
    on<LoginUsernameChanged>(_onLoginUsernameChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onLoginUsernameChanged(LoginUsernameChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _onLoginPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(state.copyWith(formState: FormSubmitting()));
    try {
      await authRepo.login();
      emit(state.copyWith(formState: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formState: SubmissionFailed(e as Exception)));
    }
  }
}
