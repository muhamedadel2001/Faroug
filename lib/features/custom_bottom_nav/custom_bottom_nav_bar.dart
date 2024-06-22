import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_bar_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<NavBarCubit>(context);
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            height: 70,
            decoration: const BoxDecoration(color: Colors.white),
            child: BlocBuilder<NavBarCubit, NavBarState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          cubit.transitionPage(0);
                        },
                        icon: Icon(Icons.shopping_cart_outlined,
                            color: cubit.idx == 0
                                ? secondPurple
                                : secondGrayColor)),
                    IconButton(
                        onPressed: () {
                          cubit.transitionPage(1);
                        },
                        icon: Icon(Icons.category_outlined,
                            color: cubit.idx == 1
                                ? secondPurple
                                : secondGrayColor)),
                    SizedBox(width: ResponsiveCalc().widthRatio(65)),
                    IconButton(
                        onPressed: () {
                          cubit.transitionPage(3);
                        },
                        icon: Icon(Icons.camera_alt_outlined,
                            color: cubit.idx == 3
                                ? secondPurple
                                : secondGrayColor)),
                    IconButton(
                        onPressed: () {
                          cubit.transitionPage(4);
                        },
                        icon: Icon(Icons.account_circle_outlined,
                            color: cubit.idx == 4
                                ? secondPurple
                                : secondGrayColor)),
                  ],
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: ResponsiveCalc().widthRatio(65),
            height: ResponsiveCalc().heightRatio(65),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: list), shape: BoxShape.circle),
            child: InkWell(
              onTap: () {
                cubit.transitionPage(2);
              },
              child: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
