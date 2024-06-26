import 'package:finalproject/features/inventory/manager/prod_cubit/inventory_prod_cubit.dart';
import 'package:finalproject/features/inventory/presentation/widgets/prod_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../manager/cons_cubit/inventory_cons_cubit.dart';
import 'cons_item.dart';

class CustomListViewProdItems extends StatelessWidget {
  const CustomListViewProdItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Items ${InventoryProdCubit.get(context).prodList.length}',
          style: MyFonts.textStyle16,
        ),
        Expanded(
          child: ListView.separated(
              itemCount: InventoryProdCubit.get(context).prodList.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return ProductionItem(
                    model: InventoryProdCubit.get(context).prodList[index]);
              }),
        )
      ],
    );
  }
}
