import 'package:day22_auth_flow/auth/cubit/auth_cubit.dart';

import '../auth_repository.dart';
import './bloc/confirmation_bloc.dart';
import '../form/bloc/form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ConfirmationBloc>(
        create: (context) =>
            ConfirmationBloc(authRepo: context.read<AuthRepository>(), authCubit: context.read<AuthCubit>()),
        child: Stack(alignment: Alignment.bottomCenter, children: [_confirmationForm(), _showSignUpButton()]),
      ),
    );
  }

  Widget _confirmationForm() {
    return BlocListener<ConfirmationBloc, ConfirmationState>(
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
              _confirmationField(),
              _confirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _confirmationField() {
    return BlocBuilder<ConfirmationBloc, ConfirmationState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(icon: Icon(Icons.person), hintText: 'Confirmation Code'),
          validator: (value) => state.isValidUsername ? null : 'Code must be 6 characters long',
          onChanged: (value) => context.read<ConfirmationBloc>().add(ConfirmationCodeChanged(confirmationCode: value)),
        );
      },
    );
  }

  Widget _confirmButton() {
    return BlocBuilder<ConfirmationBloc, ConfirmationState>(
      builder: (context, state) {
        return state.formState is FormSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.read<ConfirmationBloc>().add(ConfirmationSubmitted());
                  }
                },
                child: Text('Confirm'));
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _showSignUpButton() {
    return SafeArea(child: Container());
  }
}
