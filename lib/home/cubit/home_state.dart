part of 'home_cubit.dart';

enum HomeStatus { loading, success, failure }

extension HomeStatusX on HomeStatus {
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
}

class HomeState extends Equatable {
  const HomeState._({
    this.status = HomeStatus.loading,
    this.pokemonList = const <Pokemon>[]
  });

  final HomeStatus status;
  final List<Pokemon> pokemonList;

  const HomeState.loading() : this._();
  const HomeState.success(List<Pokemon> pokemonList)
    : this._(status: HomeStatus.success, pokemonList: pokemonList);
  const HomeState.failure() : this._(status: HomeStatus.failure);

  @override
  List<Object?> get props => [status, pokemonList];
}
