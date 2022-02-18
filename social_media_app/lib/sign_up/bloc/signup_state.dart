part of 'signup_bloc.dart';

class SignupState {
  final String username;
  final String email;
  final String password;
  final FormStatus formState;

  bool get isValidUsername => username.length > 3;
  bool get isValidEmail => email.length > 5;
  bool get isValidPassword => password.length > 6;

  SignupState({this.username = '', this.email = '', this.password = '', this.formState = const InitialFormStatus()});

  SignupState copyWith({String? username, String? email, String? password, FormStatus? formState}) {
    return SignupState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      formState: formState ?? this.formState,
    );
  }
}
