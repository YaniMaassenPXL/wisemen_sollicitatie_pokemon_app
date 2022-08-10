import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_api/pokemon_api.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.pokemonApiClient})
      : super(const HomeState._(status: HomeStatus.loading));

  final PokemonApiClient pokemonApiClient;

  Future<void> fetchList() async {
    try {
      final pokemon = await pokemonApiClient.getAllPokemon();
      emit(HomeState.success(pokemon));
    } on Exception {
      emit(HomeState.failure());
    }
  }
}
