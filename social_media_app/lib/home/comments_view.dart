import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommentsView extends StatelessWidget {
  final _dummyAvatar =
      'https://static.wikia.nocookie.net/inuyasha/images/b/b5/Inuyasha.png/revision/latest?cb=20151128185518';

  const CommentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comments')),
      body: _commentsListView(),
    );
  }

  Widget _commentsListView() {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return _commentView();
        });
  }

  Widget _commentView() {
    const double avatarDiameter = 44;
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            width: avatarDiameter,
            height: avatarDiameter,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(avatarDiameter / 2),
              child: CachedNetworkImage(
                imageUrl: _dummyAvatar,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Flexible(
          child: Text(
            'Dette er et helt fantastisk billede, der bliver vist i Viskum Tech\'s fantastiske app.',
            maxLines: 5,
          ),
        )
      ],
    );
  }
}
