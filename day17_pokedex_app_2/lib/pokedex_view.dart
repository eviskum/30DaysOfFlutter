import 'package:day17_pokedex_app_2/cubit/nav_cubit.dart';

import 'bloc/pokemon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexView extends StatefulWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  State<PokedexView> createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PokemonBloc>().add(PokemonLoadPageRequest());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

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
              controller: _scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: state.hasMorePages ? state.pokemonList.length + 1 : state.pokemonList.length,
              itemBuilder: (context, index) {
                if (index == state.pokemonList.length)
                  return Card(
                    child: GridTile(child: CircularProgressIndicator()),
                  );
                return Card(
                  child: GestureDetector(
                      child: GridTile(
                        child: Column(
                          children: [
                            Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${state.pokemonList[index].id}.png'),
                            FittedBox(fit: BoxFit.fitWidth, child: Text(state.pokemonList[index].name ?? 'No name')),
                          ],
                        ),
                      ),
                      onTap: () => BlocProvider.of<NavCubit>(context).showDetails(state.pokemonList[index].id)),
                );
              });
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
