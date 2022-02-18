import 'package:flutter/material.dart';

class ContentGridView extends StatelessWidget {
  const ContentGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 20,
      itemBuilder: (context, index) => Card(
        child: GridTile(
          child: Center(child: Text(index.toString())),
        ),
      ),
    );
  }
}
