import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../core/utilities/styles/colors.dart';
import '../../../../../core/utilities/logic/responsive.dart';
import '../../../manager/feed_indicator.dart/feed_indicator_cubit.dart';

class FeedServedFiltration extends StatelessWidget {
  const FeedServedFiltration(
      {super.key, required this.nomFlocks, required this.feeded});
  final int nomFlocks;
  final double feeded;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FeedIndicatorCubit>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ResponsiveCalc().widthRatio(13)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 8),
            width: ResponsiveCalc().widthRatio(233),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today’s Requirement: ${nomFlocks * 100}g',
                  style: MyFonts.textStyle12,
                ),
                const SizedBox(height: 1.5),
                LinearPercentIndicator(
                  width: ResponsiveCalc().widthRatio(141.0),
                  lineHeight: ResponsiveCalc().heightRatio(5.0),
                  percent: cubit.getPercentage(nomFlocks.toDouble()),
                  backgroundColor: borderColor,
                  progressColor: primaryPurple,
                ),
              ],
            ),
          ),
          SizedBox(width: ResponsiveCalc().widthRatio(16)),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            height: ResponsiveCalc().heightRatio(40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(colors: blueLinear)),
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
          )),
        ],
      ),
    );
  }
}
