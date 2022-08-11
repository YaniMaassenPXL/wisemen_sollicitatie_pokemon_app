import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';

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
      emit(state.copyWith(
        status: HomeStatus.success,
        pokemonList: pokemon,
        filteredPokemonList: pokemon,
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
}
