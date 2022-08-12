import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:hive/hive.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.pokemonApiClient})
      : super(HomeState._(status: HomeStatus.loading)){
    on<FetchList>(_fetchList);
    on<SearchQueryChanged>(_filterList);
  }

  final PokemonApiClient pokemonApiClient;

  Future<void> _fetchList(FetchList event, Emitter<HomeState> emit) async {
    try {
      final pokemon = await pokemonApiClient.getAllPokemon();
      final favoritesBox = await Hive.openBox('favorites');
      final teamBox = await Hive.openBox('team');
      emit(state.copyWith(
        status: HomeStatus.success,
        pokemonList: pokemon,
        filteredPokemonList: pokemon,
        favorites: favoritesBox.length,
        team: teamBox.length
      ));
    } on Exception {
      final viewedBox = await Hive.openBox('viewed');
      final favoritesBox = await Hive.openBox('favorites');
      final teamBox = await Hive.openBox('team');

      List<Pokemon> pokemonList = <Pokemon>[];
      viewedBox.values.forEach((pokemon) {
        pokemonList.add(Pokemon.fromJson(jsonDecode(pokemon)));
      });

      emit(state.copyWith(
          status: HomeStatus.success,
          pokemonList: pokemonList,
          filteredPokemonList: pokemonList,
          favorites: favoritesBox.length,
          team: teamBox.length
      ));
    }
  }

  Future<void> _filterList(SearchQueryChanged event, Emitter<HomeState> emit) async {
    final filteredPokemonList = state.pokemonList.where((pokemon) => pokemon.name.contains(event.searchQuery) ||
        pokemon.id.toString().contains(event.searchQuery) ||
        pokemon.types.first.type.name.contains(event.searchQuery) ||
        pokemon.types.last.type.name.contains(event.searchQuery))
        .toList();
    emit(state.copyWith(
      filteredPokemonList: filteredPokemonList
    ));
  }
}
