import 'package:finalproject/core/widgets/floting_action_add.dart';
import 'package:finalproject/core/widgets/no_data.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:finalproject/features/new_flock/manager/cubit_all_flocks/my_flocks_cubit.dart';
import 'package:finalproject/features/new_flock/presentation/widgets/new_flock_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/screens.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_ two_options_tab_bar_buttons.dart';
import '../../manager/tab_bar_cubit/cubit/tab_bar_cubit_cubit.dart';

class NewFlock extends StatefulWidget {
  const NewFlock({super.key});

  @override
  State<NewFlock> createState() => _NewFlockState();
}

class _NewFlockState extends State<NewFlock> {
  @override
  void initState() {
    BlocProvider.of<MyFlocksCubit>(context).getAllFlocks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TabBarCubit cubit = BlocProvider.of<TabBarCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<TabBarCubit, TabBarCubitState>(
        builder: (context, buttonState) {
          return Column(
            children: [
              SizedBox(height: ResponsiveCalc().heightRatio(80)),
              const Text('Flocks', style: MyFonts.textStyle32),
              SizedBox(height: ResponsiveCalc().heightRatio(32)),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveCalc().widthRatio(20)),
                child: Row(
                  children: [
                    Expanded(
                      child: TwoOptionsTabBar(
                        text: 'Active Flock',
                        pressAction: () {
                          cubit.changeType(true);
                        },
                        clr: cubit.isActive,
                      ),
                    ),
                    SizedBox(width: ResponsiveCalc().widthRatio(20)),
                    Expanded(
                      child: TwoOptionsTabBar(
                        text: 'Closed Flock',
                        pressAction: () {
                          cubit.changeType(false);
                        },
                        clr: !cubit.isActive,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ResponsiveCalc().heightRatio(40)),
              BlocBuilder<MyFlocksCubit, MyFlocksState>(
                builder: (context, flocksState) {
                  if (flocksState is MyFlocksSuccess) {
                    List<FlockModel> flocks = [];
                    if (buttonState is ActiveTabBarState) {
                      flocks = buttonState.filtration(flocksState.myFlocks);
                    } else if (buttonState is ClosedTabBarState) {
                      flocks = buttonState.filtration(flocksState.myFlocks);
                    }
                    if (flocks.isEmpty) {
                      return const NoData(title: 'Flocks');
                    } else {
                      return Expanded(
                        child: Column(
                          children: [
                            Text('total flocks : ${flocks.length}',
                                style: MyFonts.textStyle16),
                            Expanded(
                              child: ListView.builder(
                                itemCount: flocks.length,
                                itemBuilder: (context, index) => NewFlockItem(
                                  flockModel: flocks[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  } else if (flocksState is MyFlocksFailed) {
                    return Center(
                      child: Text(
                        flocksState.errMsg,
                        style: MyFonts.textStyle16.copyWith(
                            color: const Color.fromARGB(255, 255, 17, 0)),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingAddButton(
        navigate: () {
          Navigator.of(context).pushNamed(addFlock);
        },
      ),
    );
  }
}
