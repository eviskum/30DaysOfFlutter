import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../auth/cubit/auth_cubit.dart';
import '../../form/bloc/form_state.dart';
import '../../repositories/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  SignupBloc({required this.authRepo, required this.authCubit}) : super(SignupState()) {
    on<SignupUsernameChanged>(_onSignupUsernameChanged);
    on<SignupEmailChanged>(_onSignupEmailChanged);
    on<SignupPasswordChanged>(_onSignupPasswordChanged);
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  void _onSignupUsernameChanged(SignupUsernameChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _onSignupEmailChanged(SignupEmailChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onSignupPasswordChanged(SignupPasswordChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onSignupSubmitted(SignupSubmitted event, Emitter<SignupState> emit) async {
    emit(state.copyWith(formState: FormSubmitting()));
    try {
      await authRepo.signup(username: state.username, email: state.email, password: state.password);
      emit(state.copyWith(formState: SubmissionSuccess()));
      authCubit.showConfirmSignUp(username: state.username, email: state.email, password: state.password);
    } catch (e) {
      emit(state.copyWith(formState: SubmissionFailed(e as Exception)));
    }
  }
}
