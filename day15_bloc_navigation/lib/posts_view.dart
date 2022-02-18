import 'package:day15_bloc_navigation/cubit/nav_cubit.dart';

import 'bloc/posts_bloc.dart';

import 'cubit/postcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if (state is PostsStateInitial) {
          print('Cubit initial');
          return Center(
            child: TextButton(
                child: Text('Get posts'), onPressed: () => BlocProvider.of<PostsBloc>(context).add(LoadPostsEvent())),
          );
        } else if (state is PostsStateLoading) {
          print('PostsLoading');
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PostsStateError) {
          print('PostsError');
          return Center(
            child: Text('Error'),
          );
        } else if (state is PostsStateLoaded) {
          print('Posts loaded');
          final posts = state.posts;
          return RefreshIndicator(
            onRefresh: () async => BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent()),
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () => BlocProvider.of<NavCubit>(context).showPostDetails(posts[index]),
                      title: Text(posts[index].title ?? ''),
                    ),
                    // child: Column(
                    //   children: [
                    //     Text('userID ${posts[index].userId}, id ${posts[index].id}'),
                    //     Text(posts[index].title ?? ''),
                    //   ],
                    // ),
                  );
                }),
          );
        } else {
          print('...default');
          return Container();
        }
      }),
    );
  }
}
