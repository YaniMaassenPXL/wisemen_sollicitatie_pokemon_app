import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:pokemon_app_wisemen/detail/detail.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc({required PokemonApiClient pokemonApiClient, required Pokemon pokemon})
      : _pokemonApiClient = pokemonApiClient,
        super(DetailState(
        status: DetailStatus.loading,
        pokemon: pokemon,
        favorite: false,
        team: false
  )) {
    on<FetchDetails>(_onFetchDetails);
    on<AddToFavorites>(_onAddFavorite);
    on<AddToTeam>(_onAddTeam);
  }

  final PokemonApiClient _pokemonApiClient;

  Future<void> _onFetchDetails(FetchDetails event, Emitter<DetailState> emit) async {
    emit(state.copyWith(status: DetailStatus.loading));
    try {
      final pokemon = await _pokemonApiClient.getPokemonById(state.pokemon.id);
      final favoritesBox = await Hive.openBox('favorites');
      final teamBox = await Hive.openBox('team');
      final viewedBox = await Hive.openBox('viewed');

      if (!viewedBox.containsKey(pokemon.id.toString())) {
        viewedBox.put(pokemon.id.toString(), jsonEncode(pokemon));
      }

      emit(state.copyWith(
        status: DetailStatus.success,
        pokemon: pokemon,
        favorite: favoritesBox.containsKey(pokemon.id.toString()),
        team: teamBox.containsKey(pokemon.id.toString()) || teamBox.length >= 6
      ));
    } on Exception catch (_) {
      final favoritesBox = await Hive.openBox('favorites');
      final teamBox = await Hive.openBox('team');
      final viewedBox = await Hive.openBox('viewedBox');
      final pokemon = Pokemon.fromJson(jsonDecode(viewedBox.get(state.pokemon.id)));

      emit(state.copyWith(
          status: DetailStatus.success,
          pokemon: pokemon,
          favorite: favoritesBox.containsKey(pokemon.id.toString()),
          team: teamBox.containsKey(pokemon.id.toString())
      ));
    }
  }
  
  Future<void> _onAddFavorite(AddToFavorites event, Emitter<DetailState> emit) async {
    final favoritesBox = await Hive.openBox('favorites');
    if (!state.favorite) {
      favoritesBox.put(state.pokemon.id.toString(), jsonEncode(state.pokemon));
      emit(state.copyWith(
        status: DetailStatus.success,
        favorite: true,
      ));
    } else {
      favoritesBox.delete(state.pokemon.id.toString());
      emit(state.copyWith(
        status: DetailStatus.success,
        favorite: false,
      ));
    }
  }

  Future<void> _onAddTeam(AddToTeam event, Emitter<DetailState> emit) async {
    final teamBox = await Hive.openBox('team');
    teamBox.put(state.pokemon.id.toString(), jsonEncode(state.pokemon));
    emit(state.copyWith(
      status: DetailStatus.success,
      team: true,
    ));
  }
}
