import 'package:bloc/bloc.dart';
import 'package:day16_pokedex_app/pokemon/pokemon.dart';
import 'package:day16_pokedex_app/pokemon_repository.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _dataRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonPageRequest>(_onLoadPage);
  }

  Future<void> _onLoadPage(PokemonPageRequest event, Emitter<PokemonState> emit) async {
    emit(PokemonLoading());
    try {
      final pokemons = await _dataRepository.getPokemonPage(event.page);
      emit(PokemonLoadSuccess(pokemons));
    } catch (e) {
      emit(PokemonLoadFailure(e as Error));
    }
  }
}
