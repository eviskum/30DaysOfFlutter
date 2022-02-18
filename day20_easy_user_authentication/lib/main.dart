import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:day20_easy_user_authentication/app_navigator.dart';
import 'package:day20_easy_user_authentication/cubit/auth_cubit.dart';

import './cubit/todo_cubit.dart';
import './loading_view.dart';
import './todos_view.dart';
import 'package:flutter/material.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_api/amplify_api.dart'; // UNCOMMENT this line after backend is deployed

// Generated in previous step
import 'models/ModelProvider.dart';
import 'amplifyconfiguration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    try {
      await Future.wait([
        Amplify.addPlugin(AmplifyAPI()),
        Amplify.addPlugin(AmplifyAuthCognito()),
        Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance)),
      ]);

      // Once Plugins are added, configure Amplify
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
      Amplify.DataStore.clear();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          // BlocProvider<TodoCubit>(
          //   create: (context) => TodoCubit()
          //     ..getTodos()
          //     ..observeTodo(),
          // ),
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit()..attemptAutoSignIn(),
          ),
        ],
        child: _amplifyConfigured ? AppNavigator() : LoadingView(),
      ),
    );
  }
}
