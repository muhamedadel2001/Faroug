import 'package:finalproject/core/utilities/screens.dart';
import 'package:finalproject/core/widgets/floting_action_add.dart';
import 'package:finalproject/core/widgets/no_data.dart';
import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';
import 'package:finalproject/features/flock_details/data/models/mortality_model.dart';
import 'package:finalproject/features/flock_details/manager/record_cubit/records_cubit.dart';
import 'package:finalproject/features/flock_details/presentation/widgets/filtration/mortality_filtration_bar.dart';
import 'package:finalproject/features/flock_details/presentation/widgets/items/mortality_item.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_circular_button.dart';

class MortalityCategoryScreen extends StatefulWidget {
  const MortalityCategoryScreen({super.key, required this.flock});
  final FlockModel flock;
  @override
  State<MortalityCategoryScreen> createState() =>
      _MortalityCategoryScreenState();
}

class _MortalityCategoryScreenState extends State<MortalityCategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<RecordsCubit>(context)
        .getRecord('morality/${widget.flock.sId}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        margin: EdgeInsets.only(
            top: ResponsiveCalc().heightRatio(43),
            bottom: ResponsiveCalc().heightRatio(5),
            left: ResponsiveCalc().widthRatio(27)),
        alignment: Alignment.centerLeft,
        child: CircularButton(
          pressAction: () => Navigator.of(context).pop(),
          icon: Icons.arrow_back_ios_rounded,
        ),
      ),
      const Text('Mortality', style: MyFonts.textStyle24),
      SizedBox(height: ResponsiveCalc().heightRatio(20)),
      BlocBuilder<RecordsCubit, RecordsState>(
        builder: (context, state) {
          if (state is RecordsSuccess) {
            List<FlockDataModel> myRecords = state.myRecords;
            if (myRecords.isEmpty) {
              return const NoData(title: 'Mortalities');
            } else {
              return Expanded(
                child: Column(
                  children: [
                    MortalityFiltrationBar(
                      allFlcoks: widget.flock.number!,
                      mortalities: myRecords.cast<MortalityModel>(),
                    ),
                    SizedBox(height: ResponsiveCalc().heightRatio(11)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: myRecords.length,
                        itemBuilder: (ctx, idx) => MortalityItem(
                            flockModel: widget.flock,
                            mortalityModel: myRecords[idx] as MortalityModel),
                      ),
                    ),
                  ],
                ),
              );
            }
          } else if (state is RecordsFailed) {
            return Center(
                child: Text(
              state.errMsg,
              style: MyFonts.textStyle16.copyWith(color: Colors.red),
            ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
    ]),  floatingActionButton: FloatingAddButton(
          navigate:() async {
            final res = await Navigator.of(context)
                .pushNamed(addMortality, arguments: {'flock_model': widget.flock});
            if (res == true) {
              BlocProvider.of<RecordsCubit>(context)
                  .getRecord('morality/${widget.flock.sId}');
            }
          },
        ));
  }
}
