import 'dart:developer';

import 'package:finalproject/features/home/manager/analysys_cubit/analysis_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';

class FinancialPerformanceContainer extends StatefulWidget {
  const FinancialPerformanceContainer({super.key});

  @override
  State<FinancialPerformanceContainer> createState() =>
      _FinancialPerformanceContainerState();
}

class _FinancialPerformanceContainerState
    extends State<FinancialPerformanceContainer> {
  late Widget totalExp;
  late Widget totalIN;
  late Widget totalNet;
  @override
  void initState() {
    BlocProvider.of<AnalysisCubit>(context).getTotals();
    totalIN = const Text('');
    totalExp = const Text('');
    totalNet = const Text('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnalysisCubit, AnalysisState>(
      listener: (context, state) {
        if (state is AnalysisLoading) {
          log('message');
          totalIN = const CircularProgressIndicator();
          totalExp = const CircularProgressIndicator();
          totalNet = const CircularProgressIndicator();
        } else if (state is AnalysisFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red, content: Text(state.errMsg)));
          // MySnackBar().showSnackBar(state.errMsg, context);
          totalIN = const Text('');
          totalExp = const Text('');
          totalNet = const Text('');
        } else if (state is AnalysisSuccess) {
          totalIN = Text(
            textAlign: TextAlign.center,
            '${state.totalIncome}',
            style: MyFonts.textStyleCard14,
          );
          totalExp = Text(
            textAlign: TextAlign.center,
            '${state.totalExpense}',
            style: MyFonts.textStyleCard14,
          );
          totalNet = Text(
            textAlign: TextAlign.center,
            '${state.totalIncome - state.totalExpense}',
            style: MyFonts.textStyleCard14,
          );
        }
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                  begin: Alignment.centerRight, colors: opacityLinear)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveCalc().widthRatio(21),
                vertical: ResponsiveCalc().heightRatio(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Financial Performance',
                  style: MyFonts.textStyle16,
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(12),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            totalExp,
                            const Text(
                              textAlign: TextAlign.center,
                              'Total Expense',
                              style: MyFonts.textStyle10,
                            )
                          ],
                        ),
                      ),
                    )),
                    SizedBox(
                      width: ResponsiveCalc().widthRatio(10),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            totalIN,
                            const Text(
                              textAlign: TextAlign.center,
                              'Total Income',
                              style: MyFonts.textStyle10,
                            )
                          ],
                        ),
                      ),
                    )),
                    SizedBox(
                      width: ResponsiveCalc().widthRatio(10),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            totalNet,
                            const Text(
                              textAlign: TextAlign.center,
                              'Net Balance',
                              style: MyFonts.textStyle10,
                            )
                          ],
                        ),
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
