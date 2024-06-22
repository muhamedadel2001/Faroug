import 'package:finalproject/features/profile/manager/profile_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../data/profile_api.dart';

class CardsInfoProfileSection extends StatelessWidget {
  const CardsInfoProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Material(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16),
          elevation: 2,
          child: SizedBox(
            width: ResponsiveCalc().widthRatio(95),
            height: ResponsiveCalc().heightRatio(70),
            child: Column(
              children: [
                SizedBox(
                  height: ResponsiveCalc().heightRatio(5),
                ),
                Flexible(
                  child: Text(
                    ProfileCubit.get(context)
                        .getBirdsModel
                        .numberOfBirds
                        .toString(),
                    style: MyFonts.textStyleCard14,
                  ),
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(5),
                ),
                const Flexible(
                  child: Text(
                    'Bird',
                    style: MyFonts.textStyleCard20,
                  ),
                ),
              ],
            ),
          ),
        )),
        SizedBox(
          width: ResponsiveCalc().widthRatio(15),
        ),
        Expanded(
            child: Material(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16),
          elevation: 2,
          child: SizedBox(
            width: ResponsiveCalc().widthRatio(95),
            height: ResponsiveCalc().heightRatio(70),
            child: Column(
              children: [
                SizedBox(
                  height: ResponsiveCalc().heightRatio(5),
                ),
                const Flexible(
                  child: Text(
                    '40m^',
                    style: MyFonts.textStyleCard14,
                  ),
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(5),
                ),
                const Flexible(
                  child: Text(
                    'Area',
                    style: MyFonts.textStyleCard20,
                  ),
                ),
              ],
            ),
          ),
        )),
        SizedBox(
          width: ResponsiveCalc().widthRatio(15),
        ),
        Expanded(
            child: Material(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16),
          elevation: 2,
          child: SizedBox(
            width: ResponsiveCalc().widthRatio(95),
            height: ResponsiveCalc().heightRatio(70),
            child: Column(
              children: [
                SizedBox(
                  height: ResponsiveCalc().heightRatio(5),
                ),
                const Flexible(
                  child: Text(
                    '22day',
                    style: MyFonts.textStyleCard14,
                  ),
                ),
                SizedBox(
                  height: ResponsiveCalc().heightRatio(5),
                ),
                const Flexible(
                  child: Text(
                    'Age',
                    style: MyFonts.textStyleCard20,
                  ),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
