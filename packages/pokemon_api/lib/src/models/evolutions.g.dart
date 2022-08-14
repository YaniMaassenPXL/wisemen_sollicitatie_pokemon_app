// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolutions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evolutions _$EvolutionsFromJson(Map<String, dynamic> json) => Evolutions(
      chain: Chain.fromJson(json['chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EvolutionsToJson(Evolutions instance) =>
    <String, dynamic>{
      'chain': instance.chain,
    };

Chain _$ChainFromJson(Map<String, dynamic> json) => Chain(
      evolves_to: (json['evolves_to'] as List<dynamic>)
          .map((e) => Chain.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: ChainSpecies.fromJson(json['species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChainToJson(Chain instance) => <String, dynamic>{
      'evolves_to': instance.evolves_to,
      'species': instance.species,
    };

ChainSpecies _$ChainSpeciesFromJson(Map<String, dynamic> json) => ChainSpecies(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ChainSpeciesToJson(ChainSpecies instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
