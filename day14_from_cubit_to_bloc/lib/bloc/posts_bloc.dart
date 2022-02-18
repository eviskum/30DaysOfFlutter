import 'package:bloc/bloc.dart';
import 'package:day14_from_cubit_to_bloc/data_service.dart';
import 'package:day14_from_cubit_to_bloc/post/post.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();

  PostsBloc() : super(PostsStateInitial()) {
    // on<PostsEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<LoadPostsEvent>(_onLoadPosts);
    on<RefreshPostsEvent>(_onRefreshPosts);
  }

  Future<void> _onLoadPosts(LoadPostsEvent event, Emitter<PostsState> emit) async {
    try {
      emit(PostsStateLoading());
      final posts = await _dataService.getPosts();
      emit(PostsStateLoaded(posts));
    } catch (e) {
      emit(PostsStateError());
    }
  }

  Future<void> _onRefreshPosts(RefreshPostsEvent event, Emitter<PostsState> emit) async {
    try {
      final posts = await _dataService.getPosts();
      emit(PostsStateLoaded(posts));
    } catch (e) {
      emit(PostsStateError());
    }
  }
}
