part of 'flock_info_cubit.dart';

@immutable
sealed class FlockInfoState {}

final class FlockInfoInitial extends FlockInfoState {}

final class FlockInfoLoading extends FlockInfoState {}

final class FlockInfoFailed extends FlockInfoState {
  final String errMsg;

  FlockInfoFailed({required this.errMsg});
}

final class FlockInfoSuccess extends FlockInfoState {}
