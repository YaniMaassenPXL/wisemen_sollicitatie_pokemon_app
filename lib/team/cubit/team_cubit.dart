import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:equatable/equatable.dart';

part 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit() : super(const TeamState.loading());

  Future<void> fetchList() async {
    try {
      final favoritesBox = await Hive.openBox('team');
      List<Pokemon> pokemonList = <Pokemon>[];
      favoritesBox.values.forEach((pokemon) {
        pokemonList.add(Pokemon.fromJson(jsonDecode(pokemon)));
      });
      emit(TeamState.success(pokemonList));
    } on Exception {
      emit(const TeamState.failure());
    }
  }

  Future<void> removeItem(String id) async {
    final favoritesBox = await Hive.openBox('team');
    favoritesBox.delete(id);
    List<Pokemon> pokemonList = <Pokemon>[];
    favoritesBox.values.forEach((pokemon) {
      pokemonList.add(Pokemon.fromJson(jsonDecode(pokemon)));
    });

    emit(TeamState.success(pokemonList));
  }
}
