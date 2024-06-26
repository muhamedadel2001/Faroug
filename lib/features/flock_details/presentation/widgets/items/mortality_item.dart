import 'package:finalproject/core/utilities/logic/delete_dialoug.dart';
import 'package:finalproject/features/flock_details/manager/record_cubit/records_cubit.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilities/styles/colors.dart';
import '../../../../../core/utilities/styles/fonts.dart';
import '../../../../../core/utilities/logic/responsive.dart';
import '../../../data/models/mortality_model.dart';

class MortalityItem extends StatelessWidget {
  const MortalityItem(
      {super.key, required this.mortalityModel, required this.flockModel});
  final MortalityModel mortalityModel;
  final FlockModel flockModel;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<RecordsCubit>(context);
    return Container(
      margin: EdgeInsets.only(
          left: ResponsiveCalc().widthRatio(25),
          right: ResponsiveCalc().widthRatio(25),
          bottom: ResponsiveCalc().heightRatio(12)),
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset('assets/images/Ellipse.png'),
            SizedBox(width: ResponsiveCalc().widthRatio(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${mortalityModel.breed}',
                  style: MyFonts.textStyle12,
                ),
                Text(
                  '${mortalityModel.numberofDead}',
                  style: MyFonts.textStyle10.copyWith(color: primaryGrayColor),
                )
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          onConfirmPressed: () {
                            cubit.deleteRecord(
                                flockModel.sId!, mortalityModel.sId!, context);
                          },
                          image: 'assets/images/Close Square.png',
                          description:
                              'Are you sure you want to delete this mortality?',
                        );
                      });
                },
                icon: const Icon(Icons.visibility_off_outlined, size: 24))
          ]),
          SizedBox(height: ResponsiveCalc().heightRatio(5)),
          const Divider()
        ],
      ),
    );
  }
}
