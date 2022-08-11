part of 'detail_bloc.dart';

enum DetailStatus { loading, failure, success}

class DetailState extends Equatable {
  const DetailState({
    required this.status,
    required this.pokemon,
    required this.favorite,
    required this.team
  });

  final DetailStatus status;
  final Pokemon pokemon;
  final bool favorite;
  final bool team;

  DetailState copyWith({
    DetailStatus? status,
    Pokemon? pokemon,
    bool? favorite,
    bool? team
  }) {
    return DetailState(
      status: status ?? this.status,
      pokemon: pokemon ?? this.pokemon,
      favorite: favorite ?? this.favorite,
      team: team ?? this.team
    );
  }

  @override
  List<Object?> get props => [ status, pokemon, favorite, team ];
}
