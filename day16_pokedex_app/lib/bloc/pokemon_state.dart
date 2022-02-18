part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoadSuccess extends PokemonState {
  final Pokemon pokemonPage;

  PokemonLoadSuccess(this.pokemonPage);

  bool get canLoadNextPage {
    return pokemonPage.next != null;
  }
}

class PokemonLoadFailure extends PokemonState {
  final Error error;

  PokemonLoadFailure(this.error);
}
