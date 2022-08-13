part of 'detail_bloc.dart';

enum DetailStatus { loading, failure, success}

class DetailState extends Equatable {
  const DetailState({
    required this.status,
    required this.pokemon,
    required this.favorite,
    required this.team,
    required this.evolutions
  });

  final DetailStatus status;
  final Pokemon pokemon;
  final bool favorite;
  final bool team;
  final List<Pokemon> evolutions;

  DetailState copyWith({
    DetailStatus? status,
    Pokemon? pokemon,
    bool? favorite,
    bool? team,
    List<Pokemon>? evolutions
  }) {
    return DetailState(
      status: status ?? this.status,
      pokemon: pokemon ?? this.pokemon,
      favorite: favorite ?? this.favorite,
      team: team ?? this.team,
      evolutions: evolutions ?? this.evolutions
    );
  }

  @override
  List<Object?> get props => [ status, pokemon, favorite, team, evolutions ];
}
