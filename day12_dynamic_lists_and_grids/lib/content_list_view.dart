import 'package:flutter/material.dart';

class ContentListView extends StatelessWidget {
  const ContentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(index.toString()),
                onTap: () => print('Du har trykket på $index'),
              ),
            ));
  }
}
