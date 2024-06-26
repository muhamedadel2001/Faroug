part of 'analysis_cubit.dart';

@immutable
sealed class AnalysisState {}

final class AnalysisInitial extends AnalysisState {}

final class AnalysisLoading extends AnalysisState {}

final class AnalysisSuccess extends AnalysisState {
  final int totalExpense;
  final int totalIncome;

  AnalysisSuccess({required this.totalExpense, required this.totalIncome});
}

final class AnalysisFailed extends AnalysisState {
  final String errMsg;

  AnalysisFailed({required this.errMsg});
}
