import 'package:day15_bloc_navigation/post/post.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final Post post;

  const PostDetails({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title ?? 'No title'),
      ),
      body: Center(
        child: Text(post.body ?? 'No body'),
      ),
    );
  }
}
