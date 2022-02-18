import 'package:bloc/bloc.dart';
import 'package:day22_auth_flow/auth/auth_credentials.dart';
import 'package:day22_auth_flow/auth_repository.dart';
import 'package:meta/meta.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;

  SessionCubit({required this.authRepo}) : super(UnknownSessionState());

  void showAuth() => emit(Unauthenticated());

  void showSession(AuthCredentials credentials) {
    // final user = dataRepo.getUser(credentials.userId);
    final user = credentials.username;
    emit(Authenticated(user: user));
  }

  void signOut() {
    authRepo.signout();
    emit(Unauthenticated());
  }

  void attemptAutoLogin() async {
    try {
      final userId = await authRepo.attemptAutoLogin();
      // final user = dataRepo.getUser(userId);
      final user = userId;
      emit(Authenticated(user: user));
    } catch (e) {
      print('Vi kunne ikke auto-logon');
      emit(Unauthenticated());
    }
  }
}
