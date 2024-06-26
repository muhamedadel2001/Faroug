import 'package:finalproject/core/utilities/logic/delete_dialoug.dart';
import 'package:finalproject/features/flock_details/manager/record_cubit/records_cubit.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilities/styles/fonts.dart';
import '../../../../../core/utilities/logic/responsive.dart';
import '../../../data/models/income_model.dart';
import '../../../manager/search_cubit/search_cubit.dart';

class IncomeItem extends StatelessWidget {
  const IncomeItem(
      {super.key,
      required,
      required this.flockModel,
      required this.incomeModel});
  final FlockModel flockModel;
  final IncomeModel incomeModel;
  @override
  Widget build(BuildContext context) {
    final SearchState currentState = context.read<SearchCubit>().state;
    final cubit = BlocProvider.of<RecordsCubit>(context);
    return Container(
      margin: EdgeInsets.only(
          left: ResponsiveCalc().widthRatio(25),
          right: ResponsiveCalc().widthRatio(25),
          bottom: ResponsiveCalc().heightRatio(22)),
      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  incomeModel.name!,
                  style: MyFonts.textStyle12,
                ),
                Text(
                  "${incomeModel.amount}",
                  style: MyFonts.textStyle20
                      .copyWith(color: const Color(0xff38CA44)),
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
                                  flockModel.sId!, incomeModel.sId!, context);
                            },
                            image: 'assets/images/Close Square.png',
                            description:
                                'Are you sure you want to delete this income ?',
                          );
                        });
                  },
                  icon: const Icon(Icons.delete_outline_rounded, size: 24))
            else
              Container()
          ]),
          const Divider()
        ],
      ),
    );
  }
}
