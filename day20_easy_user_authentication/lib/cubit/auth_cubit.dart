import 'package:bloc/bloc.dart';
import 'package:day20_easy_user_authentication/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _authRepo = AuthRepository();

  AuthCubit() : super(UnknownState());

  void signIn() async {
    try {
      final userId = await _authRepo.webSignIn();
      print('vi kalder webauth');
      if (userId != null && userId.isNotEmpty) {
        emit(Authenticated(userId: userId));
        print('webauth success');
      } else {
        emit(Unauthenticated());
        print('webauth fejl');
      }
    } catch (e) {
      print('helt skidt: ${e.toString()}');
      emit(Unauthenticated());
    }
  }

  void signOut() async {
    try {
      await _authRepo.signOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  void attemptAutoSignIn() async {
    try {
      final userId = await _authRepo.attemptAutoSignIn();
      if (userId != null && userId.isNotEmpty) {
        emit(Authenticated(userId: userId));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(Unauthenticated());
    }
  }
}
