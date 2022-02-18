import './cubit/auth_cubit.dart';
import '../confirmation/confirmation_view.dart';
import '../login/login_view.dart';
import '../sign_up/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => Navigator(
        pages: [
          if (state is AuthLogin) MaterialPage(child: LoginView()),
          if (state is AuthSignUp || state is AuthConfirmSignUp) MaterialPage(child: SignupView()),
          if (state is AuthConfirmSignUp) MaterialPage(child: ConfirmationView()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}
