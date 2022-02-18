import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kilo Loco\'s Website'),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
            child: ButtonBar(
              children: [
                navigationButton(Icons.chevron_left, (controller) => _goBack(controller)),
                navigationButton(Icons.chevron_right, (controller) => _goForward(controller)),
              ],
            ),
          ),
        ),
        body: WebView(
          initialUrl: 'https://kiloloco.com',
          onWebViewCreated: (controller) => _controller.complete(controller),
        ),
      ),
    );
  }

  Widget navigationButton(IconData icon, Function(WebViewController?) onPressed) {
    return FutureBuilder(
        future: _controller.future,
        builder: (context, AsyncSnapshot<WebViewController> snapshot) {
          if (snapshot.hasData) {
            return IconButton(
              onPressed: () => onPressed(snapshot.data),
              icon: Icon(icon),
              color: Colors.white,
            );
          } else {
            return Container();
          }
        });
  }

  void _goBack(WebViewController? controller) async {
    if (controller != null) {
      final canGoBack = await controller.canGoBack();
      if (canGoBack) controller.goBack();
    }
  }

  void _goForward(WebViewController? controller) async {
    if (controller != null) {
      final canGoForward = await controller.canGoForward();
      if (canGoForward) controller.goForward();
    }
  }
}
