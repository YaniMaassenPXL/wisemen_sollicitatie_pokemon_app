part of 'home_bloc.dart';

enum HomeStatus { loading, success, failure }

extension HomeStatusX on HomeStatus {
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
}

class HomeState extends Equatable {
  HomeState._({
    this.status = HomeStatus.loading,
    this.pokemonList = const <Pokemon>[],
    this.filteredPokemonList = const <Pokemon>[],
    this.sortIndex = 2
  });
  HomeState({
   required this.status,
   required this.pokemonList,
   required this.filteredPokemonList,
   this.searchQuery,
   this.favorites,
   this.team,
   required this.sortIndex
  });

  final HomeStatus status;
  final List<Pokemon> pokemonList;
  final List<Pokemon> filteredPokemonList;
  String? searchQuery;
  int? favorites;
  int? team;
  final int sortIndex;

  HomeState copyWith({
    HomeStatus? status,
    List<Pokemon>? pokemonList,
    List<Pokemon>? filteredPokemonList,
    String? searchQuery,
    int? favorites,
    int? team,
    int? sortIndex
  }) {
    return HomeState(
        status: status ?? this.status,
        pokemonList: pokemonList ?? this.pokemonList,
        filteredPokemonList: filteredPokemonList ?? this.filteredPokemonList,
        searchQuery: searchQuery ?? this.searchQuery,
        favorites: favorites ?? this.favorites,
        team: team ?? this.team,
        sortIndex: sortIndex ?? this.sortIndex
    );
  }

  @override
  List<Object?> get props => [status, pokemonList, filteredPokemonList, favorites, team];
}
