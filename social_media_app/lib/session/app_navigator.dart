import 'package:social_media_app/profile/profile_view.dart';

import '../auth/auth_navigator.dart';
import '../auth/cubit/auth_cubit.dart';
import '../bottom_navbar/bottom_navbar_view.dart';
import '../loading_view.dart';
import 'session_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/session_cubit.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            if (state is UnknownSessionState) MaterialPage(child: LoadingView()),
            if (state is Unauthenticated)
              MaterialPage(
                child: BlocProvider<AuthCubit>(
                  create: (context) => AuthCubit(session: context.read<SessionCubit>()),
                  child: AuthNavigator(),
                ),
              ),
            if (state is Authenticated)
              MaterialPage(child: BottomNavBarView()
                  //   child: SessionView(
                  // username: state.user.username,)
                  ),
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      },
    );
  }
}
