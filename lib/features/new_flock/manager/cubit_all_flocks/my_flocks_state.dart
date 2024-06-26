part of 'my_flocks_cubit.dart';

@immutable
sealed class MyFlocksState {}

final class MyFlocksInitial extends MyFlocksState {}

final class MyFlocksLoading extends MyFlocksState {}

final class MyFlocksSuccess extends MyFlocksState {

  final List<FlockModel> myFlocks;
  MyFlocksSuccess({ this.myFlocks = const [] });

  
}

final class MyFlocksFailed extends MyFlocksState {
  final String errMsg;

  MyFlocksFailed({required this.errMsg});
}
