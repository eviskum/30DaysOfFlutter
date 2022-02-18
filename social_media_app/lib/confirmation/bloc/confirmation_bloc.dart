import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../auth/cubit/auth_cubit.dart';
import '../../repositories/auth_repository.dart';
import '../../form/bloc/form_state.dart';

part 'confirmation_event.dart';
part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  ConfirmationBloc({required this.authRepo, required this.authCubit}) : super(ConfirmationState()) {
    on<ConfirmationCodeChanged>(_onConfirmationCodeChanged);
    on<ConfirmationSubmitted>(_onConfirmationSubmitted);
  }

  void _onConfirmationCodeChanged(ConfirmationCodeChanged event, Emitter<ConfirmationState> emit) {
    emit(state.copyWith(confirmationCode: event.confirmationCode));
  }

  void _onConfirmationSubmitted(ConfirmationSubmitted event, Emitter<ConfirmationState> emit) async {
    emit(state.copyWith(formState: FormSubmitting()));
    try {
      await authRepo.confirmSignup(
          username: authCubit.credentials?.username ?? '', confirmationCode: state.confirmationCode);
      // print(userId);
      emit(state.copyWith(formState: SubmissionSuccess()));

      final credentials = authCubit.credentials!;
      authRepo.signout();
      final userId = await authRepo.login(username: credentials.username, password: credentials.password ?? '');
      // final userId = await authRepo.attemptAutoLogin();
      credentials.userId = userId;
      authCubit.launchSession(credentials);
    } on StateError catch (e) {
      print(e);
    } catch (e) {
      print('fejl fejl');
      emit(state.copyWith(formState: SubmissionFailed(e as Exception)));
    }
  }
}
