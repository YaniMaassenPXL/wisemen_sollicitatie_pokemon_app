part of 'favorites_cubit.dart';

enum FavoritesStatus { loading, success, failure }

class FavoritesState extends Equatable {
  const FavoritesState._({
    this.status = FavoritesStatus.loading,
    this.pokemonList = const <Pokemon>[],
  });

  const FavoritesState.loading() : this._();

  const FavoritesState.success(List<Pokemon> items)
      : this._(status: FavoritesStatus.success, pokemonList: items);

  const FavoritesState.failure() : this._(status: FavoritesStatus.failure);

  final FavoritesStatus status;
  final List<Pokemon> pokemonList;

  @override
  List<Object> get props => [status, pokemonList];
}
