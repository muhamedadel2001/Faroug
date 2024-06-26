import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/features/inventory/data/model/cons_model/inventory_cons_model.dart';
import 'package:flutter/material.dart';

class ConsumptionItem extends StatelessWidget {
  final ConsumptionInventories model;
  const ConsumptionItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: model.category == 'Food'
                ? Image.asset('assets/images/food.png')
                : model.category == 'Medicine'
                    ? Image.asset('assets/images/medicine.png')
                    : Image.asset('assets/images/vaccine.png'),
            title: Text(model.name!, style: MyFonts.textStyle16),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                model.category == 'Food'
                    ? Text(
                        '${model.quantity.toString()} bags',
                        style: MyFonts.textStyle12
                            .copyWith(color: primaryGrayColor),
                      )
                    : model.category == 'Medicine'
                        ? Text(
                            '${model.quantity.toString()} Tablets',
                            style: MyFonts.textStyle12
                                .copyWith(color: primaryGrayColor),
                          )
                        : Text(
                            '${model.quantity.toString()} Vaccines',
                            style: MyFonts.textStyle12
                                .copyWith(color: primaryGrayColor),
                          ),
                Text(
                  model.date!,
                  style: MyFonts.textStyle12.copyWith(color: primaryGrayColor),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            elevation: 1,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: ResponsiveCalc().heightRatio(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text(
                          '  In Stock',
                          style: MyFonts.textStyleForm12,
                        ),
                      ),
                      Flexible(
                        child: model.prercent! > 50
                            ? Text(
                                '${model.prercent!.toInt()}%  ',
                                style: MyFonts.textStyleForm12
                                    .copyWith(color: Colors.green),
                              )
                            : Text(
                                '${model.prercent!.toInt()}%  ',
                                style: MyFonts.textStyleForm12
                                    .copyWith(color: Colors.red),
                              ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ResponsiveCalc().heightRatio(10),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(5),
                      value: model.prercent! / 100,
                      color: brandPrimaryColor,
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveCalc().heightRatio(10),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
