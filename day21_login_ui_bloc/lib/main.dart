import 'auth_repository.dart';
import 'login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: LoginView(),
      ),
    );
  }
}
