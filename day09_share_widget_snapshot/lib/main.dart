import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Screenshot(
                controller: _screenshotController,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset('images/codepassionately.png'),
                        Text(
                          'Code Passionately',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          child: Text('Take Screenshot and Share'),
                          onPressed: _takeScreenshot,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _takeScreenshot() async {
    final imageFile = await _screenshotController.capture();
    if (imageFile != null) {
      // final directory = await getApplicationDocumentsDirectory();
      // final imagePath = await File('${directory.path}/image.png').create();
      // await imagePath.writeAsBytes(imageFile);

      // /// Share Plugin
      // await Share.shareFiles([imagePath.path]);

      String tempPath = (await getTemporaryDirectory()).path;
      final imagePath = await File('$tempPath/image.png').create();
      await imagePath.writeAsBytes(imageFile);
      await Share.shareFiles([imagePath.path], text: 'Shared from #SexyFlutterApp');

      // Share.share(File.fromRawPath(imageFile).path);
    }
  }
}
