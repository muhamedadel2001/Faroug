import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_bottom_nav_bar.dart';
import 'nav_bar_cubit.dart';

class Home extends StatelessWidget {
  int index;
  Home({super.key, this.index = -1});

  @override
  Widget build(BuildContext context) {

    print(index);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<NavBarCubit>(context);
          List<Widget> screen = cubit.screens;
          if (index != -1) {
            int? res = index;
            index = -1;
            return screen[res];
          } else {
            return screen[cubit.idx];
          }
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
