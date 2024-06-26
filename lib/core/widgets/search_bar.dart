import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';
import 'package:finalproject/features/flock_details/manager/record_cubit/records_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/styles/colors.dart';
import '../utilities/styles/fonts.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function(String val, List<FlockDataModel> records) cubitSearching;
  const CustomSearchBar({
    Key? key,
    this.onTap,
    this.validate,
    this.controller,
    required this.hintText,
    required this.cubitSearching,
  }) : super(key: key);
  final void Function()? onTap;
  final String hintText;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w * 0.875,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        style: MyFonts.textStyleForm12.copyWith(color: Colors.black),
        onTap: onTap,
        controller: controller,
        validator: validate,
        decoration: InputDecoration(
          hintText: 'Search $hintText',
          hintStyle: MyFonts.textStyleForm12,
          fillColor: borderColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: borderColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: borderColor)),
          filled: true,
          prefixIcon: const Icon(
            FontAwesomeIcons.search,
            color: Color(0xffADA4A5),
          ),
        ),
        onChanged: (val) {
          List<FlockDataModel> flocksCat =
              BlocProvider.of<RecordsCubit>(context).recordsList;
          cubitSearching(val, flocksCat);
        },
      ),
    );
  }
}
