import 'package:finalproject/core/utilities/statics.dart';
import 'package:finalproject/core/utilities/styles/colors.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/widgets/custom_dropdownfield.dart';
import 'package:finalproject/core/widgets/custom_primary_button.dart';
import 'package:finalproject/core/widgets/custom_text_field.dart';
import 'package:finalproject/features/custom_bottom_nav/home.dart';
import 'package:finalproject/features/custom_bottom_nav/nav_bar_cubit.dart';
import 'package:finalproject/features/inventory/manager/cons_cubit/inventory_cons_cubit.dart';
import 'package:finalproject/features/inventory/manager/prod_cubit/inventory_prod_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/widgets/custom_circular_button.dart';
import '../inventory_screen.dart';

class AddInventoryConsBodyScreen extends StatefulWidget {
  const AddInventoryConsBodyScreen({
    super.key,
  });

  @override
  State<AddInventoryConsBodyScreen> createState() =>
      _AddInventoryConsBodyScreenState();
}

class _AddInventoryConsBodyScreenState
    extends State<AddInventoryConsBodyScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InventoryConsCubit(),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: ResponsiveCalc().widthRatio(25),
                    top: ResponsiveCalc().heightRatio(40)),
                child: CircularButton(
                  pressAction: () {
                    nameText.clear();
                    categoryText.clear();
                    priceText.clear();
                    quantityText.clear();
                    Navigator.pop(context);
                  },
                  icon: Icons.arrow_back_ios_new,
                  clr: true,
                ),
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(40),
              ),
              const Center(
                  child: Text(
                textAlign: TextAlign.center,
                'Add Consumption',
                style: MyFonts.textStyle36,
              )),
              SizedBox(
                height: ResponsiveCalc().heightRatio(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveCalc().widthRatio(25),
                ),
                child: CustomTextFormField(
                  controller: nameText,
                  hintText: 'Name',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Field is required !';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(20),
              ),
              Padding(
                padding: EdgeInsets.only(left: ResponsiveCalc().widthRatio(25)),
                child: CustomDropDownField(
                    text: 'Category',
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is required !';
                      }
                      return null;
                    },
                    list: listItemsCons,
                    textEditingController: categoryText),
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveCalc().widthRatio(25),
                ),
                child: CustomTextFormField(
                  controller: quantityText,
                  hintText: 'Quantity',
                  type: TextInputType.number,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Field is required !';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveCalc().widthRatio(25),
                ),
                child: CustomTextFormField(
                  controller: priceText,
                  hintText: 'Price',
                  type: TextInputType.number,
                ),
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(80),
              ),
              BlocConsumer<InventoryConsCubit, InventoryConsState>(
                listener: (context, state) {
                  if (state is CreateConsItemsFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Opps something wrong ! !')));
                  }
                  if (state is CreateConsItemsSuccess) {

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => NavBarCubit(),
                              )
                            ],
                            child: Home(
                              index: 0,
                            )),
                      ),
                      (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CreateConsItemsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: brandPrimaryColor,
                      ),
                    );
                  }
                  return Padding(
                    padding:
                        EdgeInsets.only(left: ResponsiveCalc().widthRatio(25)),
                    child: PrimaryButton(
                        text: 'save',
                        pressAction: () async {
                          if (formKey.currentState!.validate()) {
                            await InventoryConsCubit.get(context)
                                .createConsumptions();
                          }
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
