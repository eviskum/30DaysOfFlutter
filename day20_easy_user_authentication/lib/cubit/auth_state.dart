part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class UnknownState extends AuthState {}

class Authenticated extends AuthState {
  final String userId;
  Authenticated({required this.userId});
}

class Unauthenticated extends AuthState {}
