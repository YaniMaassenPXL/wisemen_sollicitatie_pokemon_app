import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon extends Equatable {
  final int id;
  final String name;
  final Sprites sprites;
  final List<SlotType> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types
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

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);

  @override
  String toString() {
    return this.toJson().toString();
  }

  Sprites({
    required this.front_default
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
