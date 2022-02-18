part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class PokemonLoadPageRequest extends PokemonEvent {}

// class PokemonNextPageRequest extends PokemonEvent {}
