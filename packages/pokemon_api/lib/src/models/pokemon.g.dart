// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      types: (json['types'] as List<dynamic>)
          .map((e) => SlotType.fromJson(e as Map<String, dynamic>))
          .toList(),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => SlottedAbility.fromJson(e as Map<String, dynamic>))
          .toList(),
      base_experience: json['base_experience'] as int?,
      height: json['height'] as int?,
      is_default: json['is_default'] as bool?,
      location_area_encounters: json['location_area_encounters'] as String?,
      order: json['order'] as int?,
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => MoveDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: json['species'] == null
          ? null
          : Move.fromJson(json['species'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sprites': instance.sprites,
      'types': instance.types,
      'abilities': instance.abilities,
      'base_experience': instance.base_experience,
      'height': instance.height,
      'is_default': instance.is_default,
      'location_area_encounters': instance.location_area_encounters,
      'order': instance.order,
      'moves': instance.moves,
      'species': instance.species,
      'stats': instance.stats,
      'weight': instance.weight,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      front_default: json['front_default'] as String,
      back_default: json['back_default'] as String?,
      back_female: json['back_female'] as String?,
      back_shiny: json['back_shiny'] as String?,
      back_shiny_female: json['back_shiny_female'] as String?,
      front_female: json['front_female'] as String?,
      front_shiny: json['front_shiny'] as String?,
      front_shiny_female: json['front_shiny_female'] as String?,
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'front_default': instance.front_default,
      'back_default': instance.back_default,
      'back_female': instance.back_female,
      'back_shiny': instance.back_shiny,
      'back_shiny_female': instance.back_shiny_female,
      'front_female': instance.front_female,
      'front_shiny': instance.front_shiny,
      'front_shiny_female': instance.front_shiny_female,
    };

SlotType _$SlotTypeFromJson(Map<String, dynamic> json) => SlotType(
      slot: json['slot'] as int,
      type: Type.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SlotTypeToJson(SlotType instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      name: json['name'] as String,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
    };

SlottedAbility _$SlottedAbilityFromJson(Map<String, dynamic> json) =>
    SlottedAbility(
      ability: Ability.fromJson(json['ability'] as Map<String, dynamic>),
      is_hidden: json['is_hidden'] as bool,
      slot: json['slot'] as int,
    );

Map<String, dynamic> _$SlottedAbilityToJson(SlottedAbility instance) =>
    <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.is_hidden,
      'slot': instance.slot,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

MoveDetails _$MoveDetailsFromJson(Map<String, dynamic> json) => MoveDetails(
      move: Move.fromJson(json['move'] as Map<String, dynamic>),
      version_group_details: (json['version_group_details'] as List<dynamic>)
          .map((e) => VersionGroupDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoveDetailsToJson(MoveDetails instance) =>
    <String, dynamic>{
      'move': instance.move,
      'version_group_details': instance.version_group_details,
    };

Move _$MoveFromJson(Map<String, dynamic> json) => Move(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$MoveToJson(Move instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

VersionGroupDetails _$VersionGroupDetailsFromJson(Map<String, dynamic> json) =>
    VersionGroupDetails(
      level_learned_at: json['level_learned_at'] as int,
      move_learn_method:
          Move.fromJson(json['move_learn_method'] as Map<String, dynamic>),
      version_group:
          Move.fromJson(json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VersionGroupDetailsToJson(
        VersionGroupDetails instance) =>
    <String, dynamic>{
      'level_learned_at': instance.level_learned_at,
      'move_learn_method': instance.move_learn_method,
      'version_group': instance.version_group,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      base_stat: json['base_stat'] as int,
      effort: json['effort'] as int,
      stat: StatName.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'base_stat': instance.base_stat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

StatName _$StatNameFromJson(Map<String, dynamic> json) => StatName(
      name: json['name'] as String,
    );

Map<String, dynamic> _$StatNameToJson(StatName instance) => <String, dynamic>{
      'name': instance.name,
    };
