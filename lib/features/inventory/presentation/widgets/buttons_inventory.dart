import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_ two_options_tab_bar_buttons.dart';
import '../../manager/prod_cubit/inventory_prod_cubit.dart';

class ButtonsInventory extends StatelessWidget {

  const ButtonsInventory({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryProdCubit, InventoryProdState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
                child: TwoOptionsTabBar(
                    clr: InventoryProdCubit.get(context).onTapButton,
                    text: 'Consumption',
                    pressAction: () {

                      !InventoryProdCubit.get(context).onTapButton
                          ? InventoryProdCubit.get(context).onTap(context)
                          : null;
                    })),
            SizedBox(
              width: ResponsiveCalc().widthRatio(20),
            ),
            Expanded(
                child: TwoOptionsTabBar(
                    clr: !InventoryProdCubit.get(context).onTapButton,
                    text: 'Production',
                    pressAction: () {

                      InventoryProdCubit.get(context).onTapButton
                          ? InventoryProdCubit.get(context).onTap(context)
                          : null;
                    })),
          ],
        );
      },
    );
  }
}
