import 'package:day12_dynamic_lists_and_grids/content_grid_view.dart';
import 'package:day12_dynamic_lists_and_grids/content_list_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.white70,
            appBar: AppBar(
              bottom: TabBar(tabs: [Text('List'), Text('Grid')]),
            ),
            body: TabBarView(
              children: [ContentListView(), ContentGridView()],
            )),
      ),
    );
  }
}
