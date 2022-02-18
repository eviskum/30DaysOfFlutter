part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoadSuccess extends PokemonState {
  List<Pokemon> pokemonList;
  int lastPageLoaded;
  bool hasMorePages;

  PokemonLoadSuccess({required this.pokemonList, required this.lastPageLoaded, required this.hasMorePages});

  PokemonLoadSuccess copyWith({List<Pokemon>? pokemonList, int? lastPageLoaded, bool? hasMorePages}) {
    return PokemonLoadSuccess(
      pokemonList: pokemonList ?? this.pokemonList,
      lastPageLoaded: lastPageLoaded ?? this.lastPageLoaded,
      hasMorePages: hasMorePages ?? this.hasMorePages,
    );
  }

  @override
  List<Object> get props => [pokemonList, lastPageLoaded, hasMorePages];
}

class PokemonLoadFailure extends PokemonState {
  final Error error;

  PokemonLoadFailure(this.error);
}
