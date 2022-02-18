import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/home/cubit/homenavigator_cubit.dart';
import 'package:social_media_app/home/home_view.dart';
import 'package:social_media_app/profile/profile_view.dart';

import 'comments_view.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeNavigatorCubit>(
      create: (context) => HomeNavigatorCubit(),
      child: BlocBuilder<HomeNavigatorCubit, HomeNavigatorState>(
        builder: (context, state) {
          return Navigator(
            pages: [
              MaterialPage(child: HomeView()),
              if (state == HomeNavigatorState.profile) MaterialPage(child: ProfileView()),
              if (state == HomeNavigatorState.comments) MaterialPage(child: CommentsView()),
            ],
            onPopPage: (route, result) {
              context.read<HomeNavigatorCubit>().showHome();
              return route.didPop(result);
            },
          );
        },
      ),
    );
  }
}
