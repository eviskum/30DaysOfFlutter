import 'package:day10_networking_requests/data_service.dart';
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
  final _dataService = DataService();
  String? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (context) {
              if (_response != null) {
                return Text(_response!);
              } else {
                return ElevatedButton(onPressed: _makeRequest, child: Text('Make Request'));
              }
            },
          ),
        ),
      ),
    );
  }

  void _makeRequest() async {
    // final response = await _dataService.makeRequestToApi();

    // setState(() {
    //   _response = response;
    // });
    print('start på _makeRequest');
    _dataService.makeRequestToApi().then((value) {
      print('start på set _response');
      setState(() {
        _response = value;
      });
      print('slut på set _response');
    });
    print('slut på _makeRequest');
  }
}
