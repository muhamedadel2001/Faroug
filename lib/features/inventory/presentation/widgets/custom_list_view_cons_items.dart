import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../manager/cons_cubit/inventory_cons_cubit.dart';
import 'cons_item.dart';

class CustomListViewConsItems extends StatelessWidget {
  const CustomListViewConsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Items ${InventoryConsCubit.get(context).consList.length}',
          style: MyFonts.textStyle16,
        ),
        Expanded(
          child: BlocBuilder<InventoryConsCubit, InventoryConsState>(
            builder: (context, state) {
              return ListView.separated(
                  itemCount: InventoryConsCubit.get(context).consList.length,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    return ConsumptionItem(
                        model:
                            InventoryConsCubit.get(context).consList[index]);
                  });
            },
          ),
        )
      ],
    );
  }
}
