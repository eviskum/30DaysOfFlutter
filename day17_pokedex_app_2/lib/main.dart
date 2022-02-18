import 'package:day17_pokedex_app_2/app_navigator.dart';
import 'package:day17_pokedex_app_2/cubit/nav_cubit.dart';
import 'package:day17_pokedex_app_2/cubit/pokemondetails_cubit.dart';

import 'bloc/pokemon_bloc.dart';
import 'pokedex_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final pokemonDetailCubit = PokemondetailsCubit();
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
          accentColor: Colors.redAccent,
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PokemonBloc()..add(PokemonLoadPageRequest()),
          ),
          BlocProvider(
            create: (context) => NavCubit(),
          ),
          BlocProvider(
            create: (context) => PokemondetailsCubit(),
          ),
        ],
        child: AppNavigator(),
      ),
    );
  }
}
