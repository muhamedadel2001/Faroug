import 'package:finalproject/core/utilities/screens.dart';
import 'package:finalproject/core/widgets/floting_action_add.dart';
import 'package:finalproject/core/widgets/no_data.dart';
import 'package:finalproject/features/flock_details/data/models/feed_serve_model.dart';
import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';
import 'package:finalproject/features/flock_details/manager/feed_indicator.dart/feed_indicator_cubit.dart';
import 'package:finalproject/features/flock_details/manager/record_cubit/records_cubit.dart';
import 'package:finalproject/features/flock_details/presentation/widgets/filtration/feed_served_filtration_bar.dart';
import 'package:finalproject/features/flock_details/presentation/widgets/items/feed_server_item.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_circular_button.dart';

class FeedServedCategoryScreen extends StatefulWidget {
  const FeedServedCategoryScreen({super.key, required this.flock});
  final FlockModel flock;
  @override
  State<FeedServedCategoryScreen> createState() =>
      _FeedServedCategoryScreenState();
}

class _FeedServedCategoryScreenState extends State<FeedServedCategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<RecordsCubit>(context)
        .getRecord('feedservied/${widget.flock.sId}');
    BlocProvider.of<FeedIndicatorCubit>(context)
        .getRequiredFeed(widget.flock.sId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FeedIndicatorCubit>(context);
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
          const Text('Feed Served', style: MyFonts.textStyle24),
          SizedBox(height: ResponsiveCalc().heightRatio(20)),
          /* NoData(title: myItem.getTitle)*/

          //bloc builder is here --->>>>
          BlocBuilder<RecordsCubit, RecordsState>(
            builder: (context, state) {
              if (state is RecordsSuccess) {
                List<FlockDataModel> myRecords = state.myRecords;
                if (myRecords.isEmpty) {
                  return const NoData(title: 'Feed Served');
                } else {
                  return Expanded(
                    child: Column(
                      children: [
                        BlocBuilder<FeedIndicatorCubit, FeedIndicatorState>(
                          builder: (context, state) {
                            return FeedServedFiltration(
                              nomFlocks: widget.flock.number!,
                              feeded: cubit.feeded,
                            );
                          },
                        ),
                        SizedBox(height: ResponsiveCalc().heightRatio(11)),
                        Expanded(
                          child: ListView.builder(
                            itemCount: myRecords.length,
                            itemBuilder: (ctx, idx) => FeedServedItem(
                              feedServedModel:
                                  myRecords[idx] as FeedServedModel,
                              flockModel: widget.flock,
                            ),
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
        ]),
        floatingActionButton: FloatingAddButton(
          navigate: () async {
            final res = await Navigator.of(context)
                .pushNamed(addFeed, arguments: {'flock_model': widget.flock});
            if (res == true) {
              BlocProvider.of<RecordsCubit>(context)
                  .getRecord('feedservied/${widget.flock.sId}');
            }
          },
        ));
  }
}
