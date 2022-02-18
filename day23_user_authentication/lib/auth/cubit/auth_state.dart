part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthLogin extends AuthState {}

class AuthSignUp extends AuthState {}

class AuthConfirmSignUp extends AuthState {}
