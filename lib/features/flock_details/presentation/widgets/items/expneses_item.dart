import 'dart:developer';
import 'package:finalproject/core/utilities/logic/delete_dialoug.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/features/flock_details/manager/record_cubit/records_cubit.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilities/logic/responsive.dart';
import '../../../data/models/expense_model.dart';
import '../../../manager/search_cubit/search_cubit.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expenseModel,
    required this.flockModel,
  });
  final FlockModel flockModel;
  final ExpenseModel expenseModel;
  @override
  Widget build(BuildContext context) {
    final SearchState currentState = context.read<SearchCubit>().state;
    final cubit = BlocProvider.of<RecordsCubit>(context);
    return Container(
      margin: EdgeInsets.only(
          left: ResponsiveCalc().widthRatio(25),
          right: ResponsiveCalc().widthRatio(25),
          bottom: ResponsiveCalc().heightRatio(22)),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${expenseModel.name}',
                  style: MyFonts.textStyle12,
                ),
                Text(
                  '${expenseModel.amount}',
                  style: MyFonts.textStyle20
                      .copyWith(color: const Color(0xffFF0000)),
                )
              ],
            ),
            const Spacer(),
            if (currentState is! SearchingState)
              IconButton(
                  onPressed: () {
                    log(expenseModel.date.toString());
                    // void Function() onConfirm = cubit.deleteRecord(
                    //             flockModel.sId!, expenseModel.sId!, context);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            onConfirmPressed: () {
                              cubit.deleteRecord(
                                  flockModel.sId!, expenseModel.sId!, context);
                            },
                            image: 'assets/images/Close Square.png',
                            description:
                                'Are you sure you want to delete this expense ?',
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
