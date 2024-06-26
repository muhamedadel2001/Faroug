import 'package:finalproject/core/utilities/logic/delete_dialoug.dart';
import 'package:finalproject/features/flock_details/manager/record_cubit/records_cubit.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilities/styles/colors.dart';
import '../../../../../core/utilities/styles/fonts.dart';
import '../../../../../core/utilities/logic/responsive.dart';
import '../../../data/models/medicine_model.dart';
import '../../../manager/search_cubit/search_cubit.dart';

class MedicineItem extends StatelessWidget {
  const MedicineItem(
      {super.key, required this.medicineModel, required this.flockModel});
  final MedicineModel medicineModel;
  final FlockModel flockModel;
  @override
  Widget build(BuildContext context) {
    final SearchState currentState = context.read<SearchCubit>().state;
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
            Image.asset('assets/images/vc.png'),
            SizedBox(width: ResponsiveCalc().widthRatio(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${medicineModel.name}',
                  style: MyFonts.textStyle12,
                ),
                Text(
                  DateTime.now().difference(medicineModel.date!).inDays != 0
                      ? '${DateTime.now().difference(medicineModel.date!).inDays} day ago'
                      : 'Today',
                  style: MyFonts.textStyle10.copyWith(color: primaryGrayColor),
                )
              ],
            ),
            const Spacer(),
            if (currentState is! SearchingState)
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            onConfirmPressed: () {
                              cubit.deleteRecord(
                                  flockModel.sId!, medicineModel.sId!, context);
                            },
                            image: 'assets/images/Close Square.png',
                            description:
                                'Are you sure you want to delete this medicine?',
                          );
                        });
                  },
                  icon: const Icon(Icons.delete_outline_rounded, size: 24))
            else
              Container()
          ]),
          SizedBox(height: ResponsiveCalc().heightRatio(5)),
          const Divider()
        ],
      ),
    );
  }
}
