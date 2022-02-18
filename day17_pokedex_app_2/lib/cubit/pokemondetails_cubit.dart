import 'package:bloc/bloc.dart';
import 'package:day17_pokedex_app_2/pokemon_details/pokemon_details.dart';
import 'package:day17_pokedex_app_2/pokemon_details_model.dart';
import 'package:day17_pokedex_app_2/pokemon_repository.dart';
import 'package:day17_pokedex_app_2/pokemon_species/pokemon_species.dart';
import 'package:equatable/equatable.dart';

part 'pokemondetails_state.dart';

class PokemondetailsCubit extends Cubit<PokemondetailsState> {
  final _dataRepository = PokemonRepository();

  PokemondetailsCubit() : super(PokemondetailsInitial());

  void clearDetails() => emit(PokemondetailsInitial());

  void getDetails(int id) async {
    emit(PokemondetailsLoading());
    try {
      final pokemonDetailsResponses = await Future.wait([
        _dataRepository.getPokemonInfo(id),
        _dataRepository.getPokemonSpeciesInfo(id),
      ]);
      // final pokemonBaseInfo = await _dataRepository.getPokemonInfo(id);
      // final pokemonSpeciesInfo = await _dataRepository.getPokemonSpeciesInfo(id);
      final pokemonBaseInfo = pokemonDetailsResponses[0] as PokemonDetails;
      final pokemonSpeciesInfo = pokemonDetailsResponses[1] as PokemonSpecies;
      final pokemonDetails = PokemonDetailsModel(
        id: pokemonBaseInfo.getId ?? 1,
        name: pokemonBaseInfo.getName ?? 'No name',
        imageUrl: pokemonBaseInfo.getImageUrl ?? 'No Url',
        typeNames: pokemonBaseInfo.getTypeNames ?? [],
        height: pokemonBaseInfo.getHeight ?? 1,
        weight: pokemonBaseInfo.getWeight ?? 1,
        description: pokemonSpeciesInfo.getDescription,
      );
      emit(PokemondetailsLoadSuccess(pokemonDetails));
    } catch (e) {
      emit(PokemondetailsLoadFailure(e as Error));
    }
  }
}
