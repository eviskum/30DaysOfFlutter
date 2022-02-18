import 'package:day20_easy_user_authentication/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => BlocProvider.of<AuthCubit>(context).signIn(),
          child: Text('Sign In'),
        ),
      ),
    );
  }
}
