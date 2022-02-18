import 'package:bloc/bloc.dart';
import 'package:day13_bloc_and_cubit/data_service.dart';
import 'package:day13_bloc_and_cubit/post/post.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'postcubit_state.dart';

class PostcubitCubit extends Cubit<PostcubitState> {
  PostcubitCubit() : super(PostcubitInitial());

  final _dataService = DataService();

  void getPosts() async {
    try {
      emit(PostsLoading());
      final posts = await _dataService.getPosts();
      emit(PostsLoaded(posts));
    } catch (e) {
      emit(PostsError());
    }
  }
}
