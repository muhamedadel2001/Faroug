/*
import 'package:finalproject/core/widgets/ll.dart';
import 'package:finalproject/features/profile/manager/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/check_health/manager/vision_cubit.dart';
import '../../features/check_health/presentation/check_health_screen.dart';
import '../../features/inventory/manager/cons_cubit/inventory_cons_cubit.dart';
import '../../features/inventory/manager/prod_cubit/inventory_prod_cubit.dart';
import '../../features/inventory/presentation/inventory_screen.dart';
import '../../features/new_flock/new_flock.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../utilities/styles/colors.dart';

class CustomBottomNavigation {
  static List<Widget> buildScreens() {
    return [
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InventoryConsCubit(),
          ),
          BlocProvider(
            create: (context) => InventoryProdCubit(),
          )
        ],
        child: const InventoryScreen(),
      ),
      const NewFlock(),
      const Test1(),
      BlocProvider(
        create: (context) => VisionCubit(),
        child: const CheckHealthScreen(),
      ),
      BlocProvider(
        create: (context) => ProfileCubit(),
        child: const ProfileScreen(),
      ),
    ];
  }

  */
/*static List<PersistentBottomNavBarItem> navBarsItems(
      PersistentTabController controller) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        activeColorPrimary: primaryPurple,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.category_outlined),
        activeColorPrimary: primaryPurple,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home,
          color: Colors.white,
        ),
        activeColorPrimary: brandPrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.camera_alt_outlined,
        ),
        activeColorPrimary: primaryPurple,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        activeColorPrimary: primaryPurple,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
*/
