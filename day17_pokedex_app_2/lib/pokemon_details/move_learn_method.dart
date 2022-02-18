import 'package:json_annotation/json_annotation.dart';

part 'move_learn_method.g.dart';

@JsonSerializable()
class MoveLearnMethod {
  String? name;
  String? url;

  MoveLearnMethod({this.name, this.url});

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) {
    return _$MoveLearnMethodFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MoveLearnMethodToJson(this);
}
