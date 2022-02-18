import 'package:day15_bloc_navigation/app_navigator.dart';
import 'package:day15_bloc_navigation/cubit/nav_cubit.dart';

import 'bloc/posts_bloc.dart';

import 'cubit/postcubit_cubit.dart';
import 'posts_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PostsBloc>(
            create: (context) => PostsBloc(),
          ),
          BlocProvider<NavCubit>(
            create: (context) => NavCubit(),
          ),
        ],
        child: AppNavigator(),
      ),
    );
  }
}
