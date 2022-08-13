part of 'team_cubit.dart';

enum TeamStatus { loading, success, failure }

class TeamState extends Equatable {
  const TeamState._({
    this.status = TeamStatus.loading,
    this.pokemonList = const <Pokemon>[],
  });

  const TeamState.loading() : this._();

  const TeamState.success(List<Pokemon> items)
      : this._(status: TeamStatus.success, pokemonList: items);

  const TeamState.failure() : this._(status: TeamStatus.failure);

  final TeamStatus status;
  final List<Pokemon> pokemonList;

  @override
  List<Object> get props => [status, pokemonList];
}
