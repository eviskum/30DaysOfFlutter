part of 'pokemondetails_cubit.dart';

abstract class PokemondetailsState extends Equatable {
  const PokemondetailsState();

  @override
  List<Object> get props => [];
}

class PokemondetailsInitial extends PokemondetailsState {}

class PokemondetailsLoading extends PokemondetailsState {}

class PokemondetailsLoadSuccess extends PokemondetailsState {
  final PokemonDetailsModel pokemonDetails;

  PokemondetailsLoadSuccess(this.pokemonDetails);
}

class PokemondetailsLoadFailure extends PokemondetailsState {
  final Error error;

  PokemondetailsLoadFailure(this.error);
}
