import 'package:bloc/bloc.dart';
import 'package:day22_auth_flow/auth/auth_credentials.dart';
import 'package:day22_auth_flow/auth/cubit/auth_cubit.dart';
import 'package:meta/meta.dart';
import '../../auth_repository.dart';
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
      final userId = await authRepo.confirmSignup(
          username: authCubit.credentials?.username ?? '', confirmationCode: state.confirmationCode);
      emit(state.copyWith(formState: SubmissionSuccess()));

      final credentials = authCubit.credentials!;
      credentials.userId = userId;
      authCubit.launchSession(credentials);
    } catch (e) {
      emit(state.copyWith(formState: SubmissionFailed(e as Exception)));
    }
  }
}
