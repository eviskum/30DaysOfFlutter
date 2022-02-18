import 'package:bloc/bloc.dart';
import '../pokemon_page/pokemon_page.dart';
import '../pokemon/pokemon.dart';
import '../pokemon_repository.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _dataRepository = PokemonRepository();
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonLoadPageRequest>(_onLoadPage);
    // on<PokemonNextPageRequest>(_onLoadNextPage);
  }

  Future<void> _onLoadPage(PokemonLoadPageRequest event, Emitter<PokemonState> emit) async {
    if (state is PokemonInitial) emit(PokemonLoading());
    try {
      int pageIdx = 0;
      if (state is PokemonLoadSuccess) {
        final pokemonLoadSuccess = (state as PokemonLoadSuccess);
        pageIdx = pokemonLoadSuccess.lastPageLoaded + 1;
        final pokemonPage = await _dataRepository.getPokemonPage(pageIdx);
        emit(
          pokemonLoadSuccess.copyWith(
              pokemonList: pokemonLoadSuccess.pokemonList + pokemonPage.pokemons!,
              lastPageLoaded: pageIdx,
              hasMorePages: pokemonPage.next != null),
        );
      } else {
        final pokemonPage = await _dataRepository.getPokemonPage(pageIdx);
        emit(PokemonLoadSuccess(pokemonList: pokemonPage.pokemons!, lastPageLoaded: pageIdx, hasMorePages: true));
      }
    } catch (e) {
      emit(PokemonLoadFailure(e as Error));
    }
  }

  // Future<void> _onLoadNextPage(PokemonNextPageRequest event, Emitter<PokemonState> emit) async {
  //   // emit(PokemonLoading());
  //   try {
  //     print('Loading more pages...');
  //     if (state is PokemonLoading) {
  //       print('Pokemon is loading');
  //     } else if (state is PokemonLoadSuccess) {
  //       print('Pokemon state is LoadSuccess');
  //     }

  //     if ((state as PokemonLoadSuccess).morePages) {
  //       print('Kalder side: ${(state as PokemonLoadSuccess).currentPage + 1}');
  //       final pokemonPage = await _dataRepository.getPokemonPage((state as PokemonLoadSuccess).currentPage + 1);
  //       (state as PokemonLoadSuccess).currentPage++;
  //       emit((state as PokemonLoadSuccess).addPage(pokemonPage: pokemonPage));
  //     }
  //     // pokemonList!.results!.addAll(pokemons.results!);
  //     // pokemonList!.next = pokemons.next;
  //     // pokemonList!.previous = pokemons.previous;
  //     // emit(PokemonLoadSuccess(pokemonList!));
  //   } catch (e) {
  //     emit(PokemonLoadFailure(e as Error));
  //   }
  // }
}
