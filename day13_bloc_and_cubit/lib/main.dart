import 'package:day13_bloc_and_cubit/cubit/postcubit_cubit.dart';
import 'package:day13_bloc_and_cubit/posts_view.dart';
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
      home: BlocProvider<PostcubitCubit>(
        create: (context) => PostcubitCubit(),
        child: PostsView(),
      ),
    );
  }
}
