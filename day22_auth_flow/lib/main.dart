import 'package:day22_auth_flow/auth/auth_navigator.dart';
import 'package:day22_auth_flow/auth/cubit/auth_cubit.dart';

import 'auth_repository.dart';
import 'login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'session/app_navigator.dart';
import 'session/cubit/session_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider<AuthRepository>(
        create: (context) => AuthRepository(),
        child: BlocProvider<SessionCubit>(
          create: (context) => SessionCubit(authRepo: context.read<AuthRepository>())..attemptAutoLogin(),
          child: AppNavigator(),
        ),
      ),
    );
  }
}
