import 'package:json_annotation/json_annotation.dart';

import 'clouds.dart';
import 'coord.dart';
import 'main.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

part 'open_weather2.g.dart';

@JsonSerializable()
class OpenWeather2 {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  String? get iconUrl {
    if (weather == null) return null;
    return 'http://openweathermap.org/img/wn/${weather![0].icon}@2x.png';
  }

  OpenWeather2({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory OpenWeather2.fromJson(Map<String, dynamic> json) {
    return _$OpenWeather2FromJson(json);
  }

  Map<String, dynamic> toJson() => _$OpenWeather2ToJson(this);
}
