import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/widgets/custom_circular_button.dart';
import 'package:finalproject/features/inventory/manager/cons_cubit/inventory_cons_cubit.dart';
import 'package:finalproject/features/inventory/manager/prod_cubit/inventory_prod_cubit.dart';
import 'package:finalproject/features/inventory/presentation/widgets/add_inventory_cons_screen.dart';
import 'package:finalproject/features/inventory/presentation/widgets/add_inventory_prod_screen.dart';
import 'package:finalproject/features/inventory/presentation/widgets/inventroy_body_screen.dart';
import 'package:finalproject/features/profile/manager/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      backgroundColor: Colors.white,
      color: brandPrimaryColor,
      onRefresh: () {
        return InventoryConsCubit.get(context).getConsumptions();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: Builder(builder: (context) {
            return CircularButton(
              pressAction: () {
                InventoryProdCubit
                    .get(context)
                    .onTapButton == true
                    ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddInventoryConsScreen(),
                  ),
                )
                    : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddInventoryProdScreen(),
                  ),
                );
              },
              icon: Icons.add,
            );
          }),
          body: const InventoryBodyScreen()),
    );
  }
}
