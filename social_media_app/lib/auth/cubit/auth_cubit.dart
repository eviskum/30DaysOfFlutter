import 'package:bloc/bloc.dart';
import '../auth_credentials.dart';
import 'package:meta/meta.dart';

import '../../session/cubit/session_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit session;

  AuthCubit({required this.session}) : super(AuthLogin());

  AuthCredentials? credentials;

  void showLogin() => emit(AuthLogin());

  void showSignUp() => emit(AuthSignUp());

  void showConfirmSignUp({required String username, String? email = null, String? password = null}) {
    credentials = AuthCredentials(username: username, email: email, password: password);
    emit(AuthConfirmSignUp());
  }

  void launchSession(AuthCredentials credentials) => session.showSession(credentials);
}
