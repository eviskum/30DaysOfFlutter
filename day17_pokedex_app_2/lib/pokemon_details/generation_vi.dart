import 'package:json_annotation/json_annotation.dart';

import 'omegaruby_alphasapphire.dart';
import 'xy.dart';

part 'generation_vi.g.dart';

@JsonSerializable()
class GenerationVi {
  @JsonKey(name: 'omegaruby-alphasapphire')
  OmegarubyAlphasapphire? omegarubyAlphasapphire;
  @JsonKey(name: 'x-y')
  Xy? xY;

  GenerationVi({this.omegarubyAlphasapphire, this.xY});

  factory GenerationVi.fromJson(Map<String, dynamic> json) {
    return _$GenerationViFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenerationViToJson(this);
}
