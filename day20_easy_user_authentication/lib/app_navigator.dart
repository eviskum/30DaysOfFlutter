import 'package:day20_easy_user_authentication/auth_view.dart';
import 'package:day20_easy_user_authentication/cubit/auth_cubit.dart';
import 'package:day20_easy_user_authentication/cubit/todo_cubit.dart';
import 'package:day20_easy_user_authentication/loading_view.dart';
import 'package:day20_easy_user_authentication/todos_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            if (state is Unauthenticated) MaterialPage(child: AuthView()),
            if (state is Authenticated) MaterialPage(child: _todoViewAndState(state.userId)),
            if (state is UnknownState) MaterialPage(child: LoadingView()),
          ],
          onPopPage: (route, result) => route.didPop(result),
        );
      },
    );
  }

  BlocProvider<TodoCubit> _todoViewAndState(String userId) {
    return BlocProvider<TodoCubit>(
      create: (context) => TodoCubit(userId: userId)
        ..getTodos()
        ..observeTodo(),
      child: TodosView(),
    );
  }
}
