import './session/cubit/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionView extends StatelessWidget {
  final String username;
  const SessionView({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Session View'),
            Text('Hello $username'),
            TextButton(onPressed: () => BlocProvider.of<SessionCubit>(context).signOut(), child: Text('Sign out'))
          ],
        ),
      ),
    );
  }
}
