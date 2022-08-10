part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class FetchList extends HomeEvent {}

class SearchQueryChanged extends HomeEvent {
  const SearchQueryChanged({required this.searchQuery});

  final String searchQuery;

  @override
  List<Object> get props => [searchQuery];
}