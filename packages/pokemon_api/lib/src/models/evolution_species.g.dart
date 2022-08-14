// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionSpecies _$EvolutionSpeciesFromJson(Map<String, dynamic> json) =>
    EvolutionSpecies(
      evolution_chain: EvolutionChain.fromJson(
          json['evolution_chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EvolutionSpeciesToJson(EvolutionSpecies instance) =>
    <String, dynamic>{
      'evolution_chain': instance.evolution_chain,
    };

EvolutionChain _$EvolutionChainFromJson(Map<String, dynamic> json) =>
    EvolutionChain(
      url: json['url'] as String,
    );

Map<String, dynamic> _$EvolutionChainToJson(EvolutionChain instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
