import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/features/inventory/data/model/cons_model/inventory_cons_model.dart';
import 'package:finalproject/features/inventory/data/model/prod_model/inventory_prod_model.dart';
import 'package:flutter/material.dart';

class ProductionItem extends StatelessWidget {
  final ProductionInventories model;
  const ProductionItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: Image.asset('assets/images/prd.png'),
            title: Text(model.name!, style: MyFonts.textStyle16),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.quantity.toString()!} Trays',
                  style: MyFonts.textStyle12.copyWith(color: primaryGrayColor),
                ),
                Text(
                  model.date!,
                  style: MyFonts.textStyle12.copyWith(color: primaryGrayColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
