
import 'package:finalproject/features/flock_details/data/models/mortality_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilities/styles/colors.dart';
import '../../../../../core/utilities/styles/fonts.dart';
import '../../../../../core/utilities/logic/responsive.dart';
import '../../../manager/search_cubit/search_cubit.dart';

class MortalityFiltrationBar extends StatelessWidget {
  const MortalityFiltrationBar(
      {super.key, required this.mortalities, required this.allFlcoks});
  final List<MortalityModel> mortalities;
  final int allFlcoks;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SearchCubit>(context);
    return Container(
      margin: EdgeInsets.only(
        left: ResponsiveCalc().widthRatio(8),
        right: ResponsiveCalc().widthRatio(8),
        top: ResponsiveCalc().heightRatio(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.only(left: 6, right: 6, top: 10, bottom: 10),
             /* height: ResponsiveCalc().heightRatio(40),*/
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      offset: const Offset(0.0, 4),
                      blurRadius: 4)
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Total Mortality: ${cubit.getTotalMortality(mortalities)}',
                style: MyFonts.textStyle12,
              ),
            ),
          ),
          SizedBox(width: ResponsiveCalc().widthRatio(8)),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.only(left: 6, right: 6, top: 10, bottom: 10),
            /*  height: ResponsiveCalc().heightRatio(40),*/
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0.0, 4),
                      blurRadius: 4)
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Percentage: ${(cubit.getTotalMortality(mortalities) / allFlcoks * 100).toInt()}%',
                style: MyFonts.textStyle12,
              ),
            ),
          ),
          SizedBox(width: ResponsiveCalc().widthRatio(8)),
          Container(
            alignment: Alignment.center,
            height: ResponsiveCalc().heightRatio(40),
            width: ResponsiveCalc().widthRatio(87),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(colors: purpleLinear)),
            child: DropdownButton(
              value: 'All items',
              icon: const Icon(Icons.keyboard_arrow_down_outlined,
                  color: Colors.white),
              hint: Text(
                'All Time',
                style: MyFonts.textStyle12.copyWith(color: Colors.white),
              ),
              items: const [],
              onChanged: (val) {},
            ),
          )
        ],
      ),
    );
  }
}
