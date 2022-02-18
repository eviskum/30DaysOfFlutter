import 'package:day13_bloc_and_cubit/cubit/postcubit_cubit.dart';
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
      body: BlocBuilder<PostcubitCubit, PostcubitState>(builder: (context, state) {
        if (state is PostcubitInitial) {
          print('Cubit initial');
          return Center(
            child: TextButton(
                child: Text('Get posts'), onPressed: () => BlocProvider.of<PostcubitCubit>(context).getPosts()),
          );
        } else if (state is PostsLoading) {
          print('PostsLoading');
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PostsError) {
          print('PostsError');
          return Center(
            child: Text('Error'),
          );
        } else if (state is PostsLoaded) {
          print('Posts loaded');
          final posts = state.posts;
          return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(posts[index].title ?? ''),
                  ),
                  // child: Column(
                  //   children: [
                  //     Text('userID ${posts[index].userId}, id ${posts[index].id}'),
                  //     Text(posts[index].title ?? ''),
                  //   ],
                  // ),
                );
              });
        } else {
          print('...default');
          return Container();
        }
      }),
    );
  }
}
