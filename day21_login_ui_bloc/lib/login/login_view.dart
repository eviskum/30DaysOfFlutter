import 'package:day21_login_ui_bloc/auth_repository.dart';
import 'package:day21_login_ui_bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(authRepo: context.read<AuthRepository>()),
        child: _loginForm(),
      ),
    );
  }

  Widget _loginForm() {
    return BlocListener<AuthBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formState;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _usernameField(),
              _passwordField(),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<AuthBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(icon: Icon(Icons.person), hintText: 'Username'),
          validator: (value) => state.isValidUsername ? null : 'Username is too short',
          onChanged: (value) => context.read<AuthBloc>().add(LoginUsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<AuthBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(icon: Icon(Icons.security), hintText: 'Password'),
          validator: (value) => state.isValidPassword ? null : 'Password is too short',
          onChanged: (value) => context.read<AuthBloc>().add(LoginPasswordChanged(password: value)),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<AuthBloc, LoginState>(
      builder: (context, state) {
        return state.formState is FormSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.read<AuthBloc>().add(LoginSubmitted());
                  }
                },
                child: Text('Login'));
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
