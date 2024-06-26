part of 'records_cubit.dart';

@immutable
sealed class RecordsState {}

final class RecordsInitial extends RecordsState {}

final class RecordsLoading extends RecordsState {}

final class RecordsFailed extends RecordsState {
  final String errMsg;

  RecordsFailed({required this.errMsg});
}

final class RecordsSuccess extends RecordsState {
  final List<FlockDataModel> myRecords;

  RecordsSuccess(this.myRecords);
}

final class RecordsDeletedFailed extends RecordsState {
  final String errMsg;

  RecordsDeletedFailed(this.errMsg);
}

final class RecordsDeletdLoading extends RecordsState {}


