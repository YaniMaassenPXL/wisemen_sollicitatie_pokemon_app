import 'package:json_annotation/json_annotation.dart';

part 'evolution_species.g.dart';

@JsonSerializable()
class EvolutionSpecies {
  final EvolutionChain evolution_chain;

  const EvolutionSpecies({
    required this.evolution_chain
  });

  factory EvolutionSpecies.fromJson(Map<String, dynamic> json) =>
      _$EvolutionSpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionSpeciesToJson(this);
}

@JsonSerializable()
class EvolutionChain {
  final String url;

  const EvolutionChain({
    required this.url
  });

  factory EvolutionChain.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);
}