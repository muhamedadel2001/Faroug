part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchingState extends SearchState {
  final List<FlockDataModel> recordItems;

  SearchingState( this.recordItems);
}
