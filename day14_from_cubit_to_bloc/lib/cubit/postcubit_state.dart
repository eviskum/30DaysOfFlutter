part of 'postcubit_cubit.dart';

@immutable
abstract class PostcubitState extends Equatable {}

class PostcubitInitial extends PostcubitState {
  @override
  List<Object> get props => [];
}

class PostsLoading extends PostcubitState {
  @override
  List<Object> get props => [];
}

class PostsLoaded extends PostcubitState {
  final List<Post> posts;
  PostsLoaded(this.posts);

  @override
  List<Post> get props => posts;
}

class PostsError extends PostcubitState {
  @override
  List<Object> get props => [];
}
