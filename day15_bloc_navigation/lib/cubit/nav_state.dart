part of 'nav_cubit.dart';

abstract class NavState extends Equatable {
  const NavState();

  @override
  List<Object> get props => [];
}

class NavInitial extends NavState {}

class NavPostSelected extends NavState {
  final Post post;
  NavPostSelected(this.post);

  @override
  List<Post> get props => [post];
}
