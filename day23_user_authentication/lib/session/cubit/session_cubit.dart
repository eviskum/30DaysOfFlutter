import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:day23_user_authentication/data_repository.dart';
import 'package:day23_user_authentication/models/User.dart';
import '../../auth/auth_credentials.dart';
import '../../auth_repository.dart';
import 'package:meta/meta.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;
  final DataRepository dataRepo;

  SessionCubit({required this.authRepo, required this.dataRepo}) : super(UnknownSessionState());

  void showAuth() => emit(Unauthenticated());

  void showSession(AuthCredentials credentials) async {
    try {
      if (credentials.userId == null) throw Exception('userId missing');
      User? user = await dataRepo.getUserById(credentials.userId!);
      user ??= await dataRepo.createUser(
        userId: credentials.userId!,
        username: credentials.username,
        email: credentials.email,
      );
      emit(Authenticated(user: user));
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  void signOut() {
    authRepo.signout();
    emit(Unauthenticated());
  }

  void attemptAutoLogin() async {
    try {
      final userId = await authRepo.attemptAutoLogin();
      if (userId == null) {
        emit(Unauthenticated());
      } else {
        // final user = userId;
        User? user = await dataRepo.getUserById(userId);
        user ??= await dataRepo.createUser(userId: userId, username: 'User-${UUID().toString()}');
        emit(Authenticated(user: user));
      }
    } catch (e) {
      print('Vi kunne ikke auto-logon');
      emit(Unauthenticated());
    }
  }
}
