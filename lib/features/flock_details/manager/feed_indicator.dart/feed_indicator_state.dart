part of 'feed_indicator_cubit.dart';

@immutable
sealed class FeedIndicatorState {}

final class FeedIndicatorInitial extends FeedIndicatorState {}

final class FeedIndicatorLoading extends FeedIndicatorState {}

final class FeedIndicatorSuccess extends FeedIndicatorState {


  FeedIndicatorSuccess();
}

final class FeedIndicatorFailed extends FeedIndicatorState {}
