import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/features/home/presentation/widgets/financial_analysis_container.dart';
import 'package:finalproject/features/home/presentation/widgets/financial_performane_container.dart';
import 'package:flutter/material.dart';

class AnalysisFlocks extends StatelessWidget {
  const AnalysisFlocks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: ResponsiveCalc().heightRatio(14)),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FinancialPerformanceContainer(),
          SizedBox(
            height: ResponsiveCalc().heightRatio(17),
          ),
          FinancialAnalysisContainer(),
        ],
      )),
    );
  }
}
