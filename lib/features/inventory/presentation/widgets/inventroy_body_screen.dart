import 'package:finalproject/features/inventory/manager/prod_cubit/inventory_prod_cubit.dart';
import 'package:finalproject/features/inventory/presentation/widgets/custom_list_view_cons_items.dart';
import 'package:finalproject/features/inventory/presentation/widgets/custom_list_view_prod_items.dart';
import 'package:finalproject/features/inventory/presentation/widgets/tap_on_button_inventory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../manager/cons_cubit/inventory_cons_cubit.dart';
import 'buttons_inventory.dart';

class InventoryBodyScreen extends StatefulWidget {
  const InventoryBodyScreen({
    super.key,
  });
  @override
  State<InventoryBodyScreen> createState() => _InventoryBodyScreenState();
}

class _InventoryBodyScreenState extends State<InventoryBodyScreen> {
  @override
  void initState() {
    InventoryConsCubit.get(context).getConsumptions();
    InventoryProdCubit.get(context).getPercentage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryProdCubit, InventoryProdState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
              left: ResponsiveCalc().widthRatio(20),
              right: ResponsiveCalc().widthRatio(20),
              top: ResponsiveCalc().heightRatio(80)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Inventory',
                style: MyFonts.textStyle32,
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(30),
              ),
              const ButtonsInventory(),
              SizedBox(
                height: ResponsiveCalc().heightRatio(30),
              ),
              InventoryProdCubit.get(context).onTapButton == true
                  ? BlocConsumer<InventoryConsCubit, InventoryConsState>(
                      listener: (context, state) {
                      if (state is GetConsItemsFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.all(20),
                            shape: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(15)),
                            behavior: SnackBarBehavior.floating,
                            content: const Text('Server Error Occured ! !')));
                      }
                    }, builder: (context, state) {
                      if (state is ConsumptionLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (InventoryConsCubit.get(context).consList.isEmpty &&
                            state is GetConsItemsSuccess) {
                          return Column(
                            children: [
                              const Center(
                                  child: Text(
                                textAlign: TextAlign.center,
                                'No Items Added',
                                style: MyFonts.textStyle16,
                              )),
                              SizedBox(
                                height: ResponsiveCalc().heightRatio(30),
                              ),
                              const TapOnButtonInventory(),
                            ],
                          );
                        } else {
                          if (state is GetConsItemsFailed) {
                            return Center(
                              child: InkWell(
                                onTap: () {
                                  InventoryConsCubit.get(context)
                                      .getConsumptions();
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
                          } else {
                            return const Expanded(
                                child: CustomListViewConsItems());
                          }
                        }
                      }
                    })
                  : BlocBuilder<InventoryProdCubit, InventoryProdState>(
                      builder: (context, state) {
                      if (state is ProductionsLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (InventoryProdCubit.get(context).prodList.isEmpty &&
                            state is GetProdItemsSuccess) {
                          return Column(
                            children: [
                              const Center(
                                  child: Text(
                                textAlign: TextAlign.center,
                                'No Items Added',
                                style: MyFonts.textStyle16,
                              )),
                              SizedBox(
                                height: ResponsiveCalc().heightRatio(30),
                              ),
                              const TapOnButtonInventory(),
                            ],
                          );
                        } else {
                          if (state is GetProdItemsFailed) {
                            return Center(
                              child: InkWell(
                                onTap: () {
                                  InventoryProdCubit.get(context)
                                      .getProductions();
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
                          } else {
                            return const Expanded(
                                child: CustomListViewProdItems());
                          }
                        }
                      }
                    }),
            ],
          ),
        );
      },
    );
  }
}
