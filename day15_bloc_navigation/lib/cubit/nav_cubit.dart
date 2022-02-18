import 'package:bloc/bloc.dart';
import 'package:day15_bloc_navigation/post/post.dart';
import 'package:equatable/equatable.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavInitial());

  void showPostDetails(Post post) => emit(NavPostSelected(post));

  void goBack() => emit(NavInitial());
}
