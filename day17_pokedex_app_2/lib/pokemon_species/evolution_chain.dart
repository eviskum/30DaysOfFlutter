import 'package:json_annotation/json_annotation.dart';

part 'evolution_chain.g.dart';

@JsonSerializable()
class EvolutionChain {
  String? url;

  EvolutionChain({this.url});

  factory EvolutionChain.fromJson(Map<String, dynamic> json) {
    return _$EvolutionChainFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);
}
