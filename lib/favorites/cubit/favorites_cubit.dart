import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:equatable/equatable.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState.loading());

  Future<void> fetchList() async {
    try {
      final favoritesBox = await Hive.openBox('favorites');
      List<Pokemon> pokemonList = <Pokemon>[];
      favoritesBox.values.forEach((pokemon) {
        pokemonList.add(Pokemon.fromJson(jsonDecode(pokemon)));
      });
      emit(FavoritesState.success(pokemonList));
    } on Exception {
      emit(const FavoritesState.failure());
    }
  }

  Future<void> removeItem(String id) async {
    final favoritesBox = await Hive.openBox('favorites');
    favoritesBox.delete(id);
    List<Pokemon> pokemonList = <Pokemon>[];
    favoritesBox.values.forEach((pokemon) {
      pokemonList.add(Pokemon.fromJson(jsonDecode(pokemon)));
    });

    emit(FavoritesState.success(pokemonList));
  }
}
