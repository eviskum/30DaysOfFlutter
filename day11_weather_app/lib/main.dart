import 'package:day11_weather_app/data_service.dart';
import 'package:day11_weather_app/open_weather2/open_weather2.dart';
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
  TextEditingController _cityTextController = TextEditingController();
  DataService _dataService = DataService();
  OpenWeather2? _openWeather2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_openWeather2 != null)
                Column(
                  children: [
                    Image.network(_openWeather2!.iconUrl!),
                    Text(
                      '${_openWeather2!.main!.temp}',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text('${_openWeather2!.weather![0].description}'),
                  ],
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(labelText: 'City'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(onPressed: _search, child: Text('Search')),
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);

    if (response == null) {
      print('Did not get a useful response');
      return;
    }

    setState(() => _openWeather2 = response);

    print(response.name);
  }
}
