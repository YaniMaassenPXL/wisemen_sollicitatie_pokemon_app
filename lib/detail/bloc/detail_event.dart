part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

class FetchDetails extends DetailEvent {}

class AddToFavorites extends DetailEvent {}

class AddToTeam extends DetailEvent {}
