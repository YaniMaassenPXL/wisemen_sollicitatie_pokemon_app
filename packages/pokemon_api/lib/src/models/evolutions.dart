import 'package:json_annotation/json_annotation.dart';

part 'evolutions.g.dart';

@JsonSerializable()
class Evolutions {
  final Chain chain;

  const Evolutions({
    required this.chain
  });

  factory Evolutions.fromJson(Map<String, dynamic> json) =>
      _$EvolutionsFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionsToJson(this);
}

@JsonSerializable()
class Chain {
  final List<Chain> evolves_to;
  final ChainSpecies species;

  const Chain({
    required this.evolves_to,
    required this.species
  });

  factory Chain.fromJson(Map<String, dynamic> json) =>
      _$ChainFromJson(json);

  Map<String, dynamic> toJson() => _$ChainToJson(this);
}

@JsonSerializable()
class ChainSpecies {
  final String name;
  final String url;

  const ChainSpecies({
    required this.name,
    required this.url
  });

  factory ChainSpecies.fromJson(Map<String, dynamic> json) =>
      _$ChainSpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$ChainSpeciesToJson(this);
}
