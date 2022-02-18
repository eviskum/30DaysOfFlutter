part of 'login_bloc.dart';

class LoginState {
  final String username;
  final String password;
  final FormStatus formState;

  bool get isValidUsername => username.length > 3;
  bool get isValidPassword => password.length > 6;

  LoginState({this.username = '', this.password = '', this.formState = const InitialFormStatus()});

  LoginState copyWith({String? username, String? password, FormStatus? formState}) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formState: formState ?? this.formState,
    );
  }
}
