import 'package:bloc/bloc.dart';
import 'package:day17_pokedex_app_2/cubit/pokemondetails_cubit.dart';
import 'package:equatable/equatable.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  // PokemondetailsCubit pokemondetailsCubit;

  // NavCubit({required this.pokemondetailsCubit}) : super(NavShowList());
  NavCubit() : super(NavShowList());

  void showDetails(int id) {
    emit(NavShowDetails(id));
  }

  void goBack() {
    emit(NavShowList());
  }
}
