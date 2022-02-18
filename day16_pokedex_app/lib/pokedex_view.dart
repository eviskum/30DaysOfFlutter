import 'package:day16_pokedex_app/bloc/pokemon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        if (state is PokemonInitial) {
          return Container();
        } else if (state is PokemonLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PokemonLoadSuccess) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: state.pokemonPage.results?.length ?? 0,
            itemBuilder: (context, index) => Card(
              child: GridTile(
                child: Column(
                  children: [
                    Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${state.pokemonPage.results?[index].id ?? 1}.png'),
                    Text(state.pokemonPage.results?[index].name ?? 'No name'),
                  ],
                ),
              ),
            ),
          );
        } else if (state is PokemonLoadFailure) {
          return Center(
            child: Text(state.error.toString()),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
