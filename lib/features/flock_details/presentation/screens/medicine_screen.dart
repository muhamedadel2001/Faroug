import 'package:finalproject/core/utilities/screens.dart';
import 'package:finalproject/core/widgets/floting_action_add.dart';
import 'package:finalproject/core/widgets/no_data.dart';
import 'package:finalproject/core/widgets/search_bar.dart';
import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';
import 'package:finalproject/features/flock_details/data/models/medicine_model.dart';
import 'package:finalproject/features/flock_details/manager/record_cubit/records_cubit.dart';
import 'package:finalproject/features/flock_details/presentation/widgets/items/medicine_item.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_circular_button.dart';
import '../../manager/search_cubit/search_cubit.dart';

class MedicineCategoryScreen extends StatefulWidget {
  const MedicineCategoryScreen({super.key, required this.flock});
  final FlockModel flock;
  @override
  State<MedicineCategoryScreen> createState() => _MedicineCategoryScreenState();
}

class _MedicineCategoryScreenState extends State<MedicineCategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<RecordsCubit>(context)
        .getRecord('medician/${widget.flock.sId}');
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
      const Text('Medicine', style: MyFonts.textStyle24),
      SizedBox(height: ResponsiveCalc().heightRatio(20)),
     BlocBuilder<RecordsCubit, RecordsState>(
        builder: (context, state) {
          if (state is RecordsSuccess) {
            List<FlockDataModel> myRecords = state.myRecords;
            if (myRecords.isEmpty) {
              return const NoData(title: 'Medicine');
            } else {
               var cubitSearching =
                  BlocProvider.of<SearchCubit>(context).searchingMedicine;
              return Expanded(
                child: Column(
                  children: [
                     CustomSearchBar(hintText: 'Medicine' , cubitSearching: cubitSearching,),
                    SizedBox(height: ResponsiveCalc().heightRatio(11)),
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, searchingMode) {
                        if (searchingMode is SearchingState) {
                          myRecords = searchingMode.recordItems;
                        } else {
                          myRecords = state.myRecords;
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemCount: myRecords.length,
                            itemBuilder: (ctx, idx) => MedicineItem(
                                flockModel: widget.flock,
                              medicineModel  : myRecords[idx] as MedicineModel),
                          ),
                        );
                      },
                    )
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
          navigate: () async {
            final res = await Navigator.of(context)
                .pushNamed(addMedicine, arguments: {'flock_model': widget.flock});
            if (res == true) {
              BlocProvider.of<RecordsCubit>(context)
                  .getRecord('medician/${widget.flock.sId}');
            }
          },
        ));
  }
}
