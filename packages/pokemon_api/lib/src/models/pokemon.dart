import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon extends Equatable {
  final int id;
  final String name;
  final Sprites sprites;
  final List<SlotType> types;
  List<SlottedAbility>? abilities;
  int? base_experience;
  int? height;
  bool? is_default;
  String? location_area_encounters;
  int? order;
  List<MoveDetails>? moves;
  Move? species;
  List<Stat>? stats;
  int? weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types,
    this.abilities,
    this.base_experience,
    this.height,
    this.is_default,
    this.location_area_encounters,
    this.order,
    this.moves,
    this.species,
    this.stats,
    this.weight
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  @override
  String toString() {
    return this.toJson().toString();
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

@JsonSerializable()
class Sprites {
  final String front_default;
  String? back_default;
  String? back_female;
  String? back_shiny;
  String? back_shiny_female;
  String? front_female;
  String? front_shiny;
  String? front_shiny_female;

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);

  @override
  String toString() {
    return this.toJson().toString();
  }

  Sprites({
    required this.front_default,
    required this.back_default,
    required this.back_female,
    required this.back_shiny,
    required this.back_shiny_female,
    required this.front_female,
    required this.front_shiny,
    required this.front_shiny_female
  });
}

@JsonSerializable()
class SlotType {
  final int slot;
  final Type type;

  factory SlotType.fromJson(Map<String, dynamic> json) =>
      _$SlotTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SlotTypeToJson(this);

  @override
  String toString() {
    return this.toJson().toString();
  }

  SlotType({
    required this.slot,
    required this.type
  });
}

@JsonSerializable()
class Type {
  final String name;

  factory Type.fromJson(Map<String, dynamic> json) =>
      _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);

  @override
  String toString() {
    return this.toJson().toString();
  }

  Type({
    required this.name
  });
}

@JsonSerializable()
class SlottedAbility {
  final Ability ability;
  final bool is_hidden;
  final int slot;

  factory SlottedAbility.fromJson(Map<String, dynamic> json) =>
      _$SlottedAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$SlottedAbilityToJson(this);

  SlottedAbility({
    required this.ability,
    required this.is_hidden,
    required this.slot
  });
}

@JsonSerializable()
class Ability {
  final String name;
  final String url;

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);

  @override
  String toString() {
    return this.toJson().toString();
  }

  Ability({
    required this.name,
    required this.url
  });
}

@JsonSerializable()
class MoveDetails {
  final Move move;
  final List<VersionGroupDetails> version_group_details;

  factory MoveDetails.fromJson(Map<String, dynamic> json) =>
      _$MoveDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MoveDetailsToJson(this);

  MoveDetails({
    required this.move,
    required this.version_group_details
  });
}

@JsonSerializable()
class Move {
  final String name;
  final String url;

  factory Move.fromJson(Map<String, dynamic> json) =>
      _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);

  @override
  String toString() {
    return this.toJson().toString();
  }

  Move({
    required this.name,
    required this.url
  });
}

@JsonSerializable()
class VersionGroupDetails {
  final int level_learned_at;
  final Move move_learn_method;
  final Move version_group;

  factory VersionGroupDetails.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGroupDetailsToJson(this);

  VersionGroupDetails({
    required this.level_learned_at,
    required this.move_learn_method,
    required this.version_group
  });
}

@JsonSerializable()
class Stat {
  final int base_stat;
  final int effort;
  final StatName stat;

  factory Stat.fromJson(Map<String, dynamic> json) =>
      _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);

  Stat({
    required this.base_stat,
    required this.effort,
    required this.stat
  });
}

@JsonSerializable()
class StatName {
  final String name;

  factory StatName.fromJson(Map<String, dynamic> json) =>
      _$StatNameFromJson(json);

  Map<String, dynamic> toJson() => _$StatNameToJson(this);

  StatName({
    required this.name
  });
}