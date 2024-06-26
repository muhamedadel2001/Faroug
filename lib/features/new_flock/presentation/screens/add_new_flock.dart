import 'dart:developer';

import 'package:finalproject/core/utilities/screens.dart';
import 'package:finalproject/core/widgets/number_validation.dart';
import 'package:finalproject/core/widgets/string_validation.dart';
import 'package:finalproject/features/flock_details/manager/add_cubit/add_cubit.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/logic/responsive.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../../../core/widgets/custom_circular_button.dart';

import '../../../../core/widgets/custom_primary_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class AddNewFlock extends StatefulWidget {
  const AddNewFlock({super.key});
  @override
  State<AddNewFlock> createState() => _AddNewFlockState();
}

class _AddNewFlockState extends State<AddNewFlock> {
  @override
  void initState() {
    BlocProvider.of<AddCubit>(context).resetControllers();
    super.initState();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AddCubit>(context);
    return Scaffold(
      body: SingleChildScrollView(
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
                'Add New Flock',
                style: MyFonts.textStyle36,
              )),
              SizedBox(
                height: ResponsiveCalc().heightRatio(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveCalc().widthRatio(15),
                  right: ResponsiveCalc().widthRatio(15),
                ),
                child: CustomTextFormField(
                  controller: cubit.name,
                  hintText: 'Name',
                  validate: StringValidation().validation,
                ),
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveCalc().widthRatio(15),
                  right: ResponsiveCalc().widthRatio(15),
                ),
                child: CustomTextFormField(
                    type: TextInputType.number,
                    controller: cubit.nomOfBirds,
                    hintText: 'nom of birds',
                    validate: NumberValidation().validation),
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveCalc().widthRatio(15),
                  right: ResponsiveCalc().widthRatio(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        enabled: false,
                        controller: cubit.dateTime,
                        hintText: 'Date',
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          cubit.pickDate(context);
                        },
                        icon: const Icon(Icons.date_range_outlined)),
                  ],
                ),
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveCalc().widthRatio(15),
                  right: ResponsiveCalc().widthRatio(15),
                ),
                child: CustomTextFormField(
                  controller: cubit.breed,
                  hintText: 'breed',
                ),
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveCalc().widthRatio(15),
                  right: ResponsiveCalc().widthRatio(15),
                ),
                child: CustomTextFormField(
                  controller: cubit.price,
                  hintText: 'cost per bird',
                ),
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveCalc().widthRatio(15),
                  right: ResponsiveCalc().widthRatio(15),
                ),
                child: CustomTextFormField(
                  controller: cubit.supplier,
                  hintText: 'Supplier',
                ),
              ),
              SizedBox(
                height: ResponsiveCalc().heightRatio(20),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ResponsiveCalc().widthRatio(15),
                  right: ResponsiveCalc().widthRatio(15),
                ),
                child: BlocConsumer<AddCubit, AddState>(
                  listener: (context, state) {
                    if (state is AddLoading) {
                      cubit.title = 'Loading';
                    } else if (state is AddFalied) {
                      cubit.title = 'Save';
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.errMsg)));
                    } else if (state is AddSuccess) {
                      Navigator.of(context)
                          .pushNamed(home, arguments: {'index': 1});
                    }
                  },
                  builder: (context, state) {
                    return PrimaryButton(
                        text: cubit.title,
                        pressAction: () async {
                          log(cubit.name.text);
                          if (formKey.currentState!.validate()) {
                            cubit.createFlock();
                          }
                        });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
