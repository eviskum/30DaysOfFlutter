import '../auth/cubit/auth_cubit.dart';
import '../auth_repository.dart';
import './bloc/signup_bloc.dart';
import '../form/bloc/form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignupBloc>(
        create: (context) => SignupBloc(authRepo: context.read<AuthRepository>(), authCubit: context.read<AuthCubit>()),
        child: Stack(alignment: Alignment.bottomCenter, children: [_signupForm(), _showLoginButton(context)]),
      ),
    );
  }

  Widget _signupForm() {
    return BlocListener<SignupBloc, SignupState>(
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
              _emailField(),
              _passwordField(),
              _signupButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(icon: Icon(Icons.person), hintText: 'Username'),
          validator: (value) => state.isValidUsername ? null : 'Username is too short',
          onChanged: (value) => context.read<SignupBloc>().add(SignupUsernameChanged(username: value)),
        );
      },
    );
  }

  Widget _emailField() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(icon: Icon(Icons.email), hintText: 'Email'),
          validator: (value) => state.isValidUsername ? null : 'Email is too short',
          onChanged: (value) => context.read<SignupBloc>().add(SignupEmailChanged(email: value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(icon: Icon(Icons.security), hintText: 'Password'),
          validator: (value) => state.isValidPassword ? null : 'Password is too short',
          onChanged: (value) => context.read<SignupBloc>().add(SignupPasswordChanged(password: value)),
        );
      },
    );
  }

  Widget _signupButton() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return state.formState is FormSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.read<SignupBloc>().add(SignupSubmitted());
                  }
                },
                child: Text('Sign Up'));
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _showLoginButton(BuildContext context) {
    return SafeArea(
      child: TextButton(
        onPressed: () {
          context.read<AuthCubit>().showLogin();
        },
        child: Text('Already have an account? Login.'),
      ),
    );
  }
}
