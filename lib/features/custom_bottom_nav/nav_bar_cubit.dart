import 'package:bloc/bloc.dart';
import 'package:finalproject/features/check_health/manager/vision_cubit.dart';
import 'package:finalproject/features/inventory/manager/cons_cubit/inventory_cons_cubit.dart';
import 'package:finalproject/features/inventory/manager/prod_cubit/inventory_prod_cubit.dart';
import 'package:finalproject/features/inventory/presentation/inventory_screen.dart';
import 'package:finalproject/features/main_page_screen/data/services/water_intake/cubit/water_cubit.dart';
import 'package:finalproject/features/main_page_screen/presentation/home_page_screen.dart';
import 'package:finalproject/features/new_flock/data/all_flocks_api.dart';
import 'package:finalproject/features/new_flock/manager/cubit_all_flocks/my_flocks_cubit.dart';
import 'package:finalproject/features/new_flock/presentation/screens/new_flock.dart';
import 'package:finalproject/features/profile/manager/profile_cubit.dart';
import 'package:finalproject/features/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../check_health/presentation/check_health_screen.dart';
import '../new_flock/manager/tab_bar_cubit/cubit/tab_bar_cubit_cubit.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial(2));
  List<Widget> screens = [
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => InventoryConsCubit()),
      BlocProvider(create: (context) => InventoryProdCubit()),
      BlocProvider(create: (context) => NavBarCubit()),
    ], child: const InventoryScreen()),
    // const NewFlock(),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyFlocksCubit(AllFlocksApi()),
        ),
        BlocProvider(
          create: (context) => TabBarCubit(),
        ),
      ],
      child: const NewFlock(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileCubit()..getProfile()),
        BlocProvider(create: (context) => InventoryConsCubit()),
        BlocProvider(
            create: (context) => InventoryProdCubit()..getPercentage()),
        BlocProvider(create: (context) => WaterCubit()),
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
