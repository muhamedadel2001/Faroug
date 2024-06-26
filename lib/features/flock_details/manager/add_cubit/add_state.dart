part of 'add_cubit.dart';

@immutable
sealed class AddState {}

final class AddInitial extends AddState {}

final class AddSuccess extends AddState {
  final String? msg;

  AddSuccess({this.msg});
}

final class AddFalied extends AddState {
  final String errMsg;

  AddFalied({required this.errMsg});
}

final class AddLoading extends AddState {}
