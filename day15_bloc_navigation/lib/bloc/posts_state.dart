part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsStateInitial extends PostsState {}

class PostsStateLoading extends PostsState {}

class PostsStateLoaded extends PostsState {
  final List<Post> posts;
  PostsStateLoaded(this.posts);

  @override
  List<Post> get props => posts;
}

class PostsStateError extends PostsState {}
