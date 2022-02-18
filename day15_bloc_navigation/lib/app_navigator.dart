import 'package:day15_bloc_navigation/cubit/nav_cubit.dart';
import 'package:day15_bloc_navigation/post_details_view.dart';
import 'package:day15_bloc_navigation/posts_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, NavState>(
      builder: (context, state) {
        return Navigator(
          pages: [
            MaterialPage(child: PostsView()),
            if (state is NavPostSelected) MaterialPage(child: PostDetails(post: state.post)),
          ],
          onPopPage: (route, result) {
            BlocProvider.of<NavCubit>(context).goBack();
            return route.didPop(result);
          },
        );
      },
    );
  }
}
