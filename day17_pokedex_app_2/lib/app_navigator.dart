import 'package:day17_pokedex_app_2/cubit/nav_cubit.dart';
import 'package:day17_pokedex_app_2/cubit/pokemondetails_cubit.dart';
import 'package:day17_pokedex_app_2/pokedex_view.dart';
import 'package:day17_pokedex_app_2/pokemon_details_view.dart';
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
            MaterialPage(child: PokedexView()),
            if (state is NavShowDetails) MaterialPage(child: PokemonDetailsView(id: state.id)),
          ],
          onPopPage: (route, result) {
            BlocProvider.of<PokemondetailsCubit>(context).clearDetails();
            BlocProvider.of<NavCubit>(context).goBack();
            return route.didPop(result);
          },
        );
      },
    );
  }
}
