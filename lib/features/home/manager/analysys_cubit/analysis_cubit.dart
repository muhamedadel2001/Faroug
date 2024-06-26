import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:finalproject/features/home/data/analysis_api.dart';
import 'package:meta/meta.dart';

part 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit(this.analysisApi) : super(AnalysisInitial());
  final AnalysisApi analysisApi;
  String flockId = '';
  getTotals() async {
    try {
      emit(AnalysisLoading());
      int totalExp = await analysisApi.getTotalExpenses(flockId);
      int totalIn = await analysisApi.getTotalIncome(flockId);
      log(totalExp.toString());
      log(totalIn.toString());
      emit(AnalysisSuccess(totalExpense: totalExp, totalIncome: totalIn));
    } catch (e) {
      log(e.toString());
    }
  }
}
