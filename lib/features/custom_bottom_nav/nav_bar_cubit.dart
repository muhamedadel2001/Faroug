import 'package:bloc/bloc.dart';
import 'package:finalproject/core/widgets/lll.dart';
import 'package:finalproject/features/check_health/manager/vision_cubit.dart';
import 'package:finalproject/features/inventory/manager/cons_cubit/inventory_cons_cubit.dart';
import 'package:finalproject/features/inventory/manager/prod_cubit/inventory_prod_cubit.dart';
import 'package:finalproject/features/inventory/presentation/inventory_screen.dart';
import 'package:finalproject/features/main_page_screen/presentation/home_page_screen.dart';
import 'package:finalproject/features/new_flock/new_flock.dart';
import 'package:finalproject/features/profile/manager/profile_cubit.dart';
import 'package:finalproject/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../check_health/presentation/check_health_screen.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial(2));
  List<Widget> screens = [
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => InventoryConsCubit()),
      BlocProvider(create: (context) => InventoryProdCubit()),
      BlocProvider(create: (context) => NavBarCubit()),
    ], child: const InventoryScreen()),
    const NewFlock(),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileCubit()..getProfile()),
        BlocProvider(create: (context) => InventoryConsCubit()),
        BlocProvider(
            create: (context) => InventoryProdCubit()..getPercentage()),
      ],
      child: const HomePageScreen(),
    ),
    BlocProvider(
      create: (context) => VisionCubit(),
      child: const CheckHealthScreen(),
    ),
    BlocProvider(
      create: (context) => ProfileCubit(),
      child: const ProfileScreen(),
    ),
  ];
  int idx = 2;

  transitionPage(int index) {
    idx = index;
    emit(NavBarPressed(idx));
  }
}
