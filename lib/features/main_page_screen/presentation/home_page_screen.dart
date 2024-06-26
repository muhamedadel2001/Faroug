import 'package:finalproject/features/inventory/manager/prod_cubit/inventory_prod_cubit.dart';
import 'package:finalproject/features/main_page_screen/presentation/widget/home_page_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utilities/styles/colors.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InventoryProdCubit, InventoryProdState>(
      listener: (context, state) {
        if (state is GetPercentageFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.all(20),
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(15)),
              behavior: SnackBarBehavior.floating,
              content: const Text('Server Error Occured ! !')));
        }
      },
      builder: (context, state) {
        if (state is GetPercentageFailed) {
          return Center(
            child: InkWell(
              onTap: () {
                InventoryProdCubit.get(context).getPercentage();
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.refresh,
                    color: brandPrimaryColor,
                    size: 50,
                  ),
                  Text(
                    'Click to Reload',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )
                ],
              ),
            ),
          );
        } else if (state is GetPercentageLoading) {
          return const Center(child: CircularProgressIndicator(color: brandPrimaryColor,));
        } else {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: SafeArea(child: HomePageScreenBody()),
            ),
          );
        }
      },
    );
  }
}
