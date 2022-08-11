import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:equatable/equatable.dart';

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
  }

  final PokemonApiClient _pokemonApiClient;

  Future<void> _onFetchDetails(FetchDetails event, Emitter<DetailState> emit) async {
    emit(state.copyWith(status: DetailStatus.loading));
    try {
      final pokemon = await _pokemonApiClient.getPokemonById(state.pokemon.id);
      emit(state.copyWith(
        status: DetailStatus.success,
        pokemon: pokemon
      ));
    } on Exception catch (_) {
      emit(state.copyWith(status:  DetailStatus.failure));
    }
  }
}
