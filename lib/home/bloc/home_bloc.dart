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
    on<SortIndexChanged>(_sortList);
    on<ReverseSort>(_onReverseSort);
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
    } on PokemonApiException {
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
    } on Exception {
      emit(state.copyWith(
        status: HomeStatus.failure
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

  Future<void> _sortList(SortIndexChanged event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      status: HomeStatus.loading
    ));
    if (event.sortIndex == 0) {
      emit(state.copyWith(
        status: HomeStatus.success,
        sortIndex: event.sortIndex,
        filteredPokemonList: _sortAlphabeticallyAscending(state.filteredPokemonList)
      ));
    } else if (event.sortIndex == 1) {
      emit(state.copyWith(
        status: HomeStatus.success,
        sortIndex: event.sortIndex,
        filteredPokemonList: _sortAlphabeticallyDescending(state.filteredPokemonList)
      ));
    } else if (event.sortIndex == 2) {
      emit(state.copyWith(
        status: HomeStatus.success,
        sortIndex: event.sortIndex,
        filteredPokemonList: _sortNumericallyAscending(state.filteredPokemonList)
      ));
    } else if (event.sortIndex == 3) {
      emit(state.copyWith(
        status: HomeStatus.success,
        sortIndex: event.sortIndex,
        filteredPokemonList: _sortNumericallyDescending(state.filteredPokemonList)
      ));
    }
  }

  Future<void> _onReverseSort(ReverseSort event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
        status: HomeStatus.loading
    ));
    if (state.sortIndex == 0) {
      emit(state.copyWith(
          status: HomeStatus.success,
          sortIndex: 1,
          filteredPokemonList: _sortAlphabeticallyDescending(state.filteredPokemonList)
      ));
    } else if (state.sortIndex == 1) {
      emit(state.copyWith(
          status: HomeStatus.success,
          sortIndex: 0,
          filteredPokemonList: _sortAlphabeticallyAscending(state.filteredPokemonList)
      ));
    } else if (state.sortIndex == 2) {
      emit(state.copyWith(
          status: HomeStatus.success,
          sortIndex: 3,
          filteredPokemonList: _sortNumericallyDescending(state.filteredPokemonList)
      ));
    } else if (state.sortIndex == 3) {
      emit(state.copyWith(
          status: HomeStatus.success,
          sortIndex: 2,
          filteredPokemonList: _sortNumericallyAscending(state.filteredPokemonList)
      ));
    }
  }

  List<Pokemon> _sortAlphabeticallyAscending(List<Pokemon> list) {
    list.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return list;
  }
  List<Pokemon> _sortAlphabeticallyDescending(List<Pokemon> list) {
    list.sort((a, b) {
      return b.name.toLowerCase().compareTo(a.name.toLowerCase());
    });
    return list;
  }
  List<Pokemon> _sortNumericallyAscending(List<Pokemon> list) {
    list.sort((a, b) {
      return a.id.compareTo(b.id);
    });
    return list;
  }
  List<Pokemon> _sortNumericallyDescending(List<Pokemon> list) {
    list.sort((a, b) {
      return b.id.compareTo(a.id);
    });
    return list;
  }
}
