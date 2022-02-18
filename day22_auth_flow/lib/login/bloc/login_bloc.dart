import 'package:bloc/bloc.dart';
import 'package:day22_auth_flow/auth/auth_credentials.dart';
import 'package:day22_auth_flow/auth/cubit/auth_cubit.dart';
import 'package:meta/meta.dart';
import '../../form/bloc/form_state.dart';
import '../../auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';
// part '../../form/bloc/form_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  LoginBloc({required this.authRepo, required this.authCubit}) : super(LoginState()) {
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

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formState: FormSubmitting()));
    try {
      final userId = await authRepo.login(username: state.username, password: state.password);
      emit(state.copyWith(formState: SubmissionSuccess()));
      authCubit.launchSession(AuthCredentials(username: state.username, userId: userId));
    } catch (e) {
      emit(state.copyWith(formState: SubmissionFailed(e as Exception)));
    }
  }
}
