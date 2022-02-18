import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homenavigator_state.dart';

class HomeNavigatorCubit extends Cubit<HomeNavigatorState> {
  HomeNavigatorCubit() : super(HomeNavigatorState.home);

  void showProfile() => emit(HomeNavigatorState.profile);
  void showComments() => emit(HomeNavigatorState.comments);
  void showHome() => emit(HomeNavigatorState.home);
}
