import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import './amplifyconfiguration.dart';
import './loading_view.dart';
import './models/ModelProvider.dart';

import 'repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/data_repository.dart';
import 'session/app_navigator.dart';
import 'session/cubit/session_cubit.dart';
import 'repositories/storage_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAmplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _isAmplifyConfigured
          ? MultiRepositoryProvider(
              providers: [
                RepositoryProvider<AuthRepository>(
                  create: (context) => AuthRepository(),
                ),
                RepositoryProvider(
                  create: (context) => DataRepository(),
                ),
                RepositoryProvider(
                  create: (context) => StorageRepository(),
                ),
              ],
              child: BlocProvider<SessionCubit>(
                create: (context) =>
                    SessionCubit(authRepo: context.read<AuthRepository>(), dataRepo: context.read<DataRepository>())
                      ..attemptAutoLogin(),
                child: AppNavigator(),
              ),
            )
          : LoadingView(),
    );
  }

  Future<void> _configureAmplify() async {
    try {
      await Amplify.addPlugins([
        AmplifyAuthCognito(),
        AmplifyDataStore(modelProvider: ModelProvider.instance),
        AmplifyAPI(),
        AmplifyStorageS3(),
      ]);
      await Amplify.configure(amplifyconfig);
      setState(() {
        _isAmplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }
}
