import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  String? name;
  String? url;

  int get id {
    return int.parse(url?.split('/')[6] ?? '1');
  }

  Result({this.name, this.url});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
