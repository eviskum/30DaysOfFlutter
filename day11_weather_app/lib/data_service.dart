import 'dart:convert';

import 'package:day11_weather_app/open_weather2/open_weather2.dart';
import 'package:http/http.dart' as http;
import 'api_keys.dart';

// api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

class DataService {
  Future<OpenWeather2?> getWeather(String city) async {
    final queryParameters = {'q': city, 'units': 'metric', 'appid': kWhetherApiKey};

    final uri = Uri.https('api.openweathermap.org', 'data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    print('HTTP response code: ${response.statusCode}');

    // OpenWeather2 openWeather = OpenWeather2.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 300) return null;

    return OpenWeather2.fromJson(jsonDecode(response.body));

    // print(openWeather.weather![0].main);
  }
}
