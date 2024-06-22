import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/styles/colors.dart';
import '../../../../core/utilities/styles/fonts.dart';
import '../../manager/signup_cubit.dart';
import '../../manager/signup_state.dart';

class CountryFormField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  CountryFormField({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return BlocListener<SignUpCubit, SignupStates>(
      listener: (context, state) {
        // Update the text field when the selected country changes
        _controller.text = state.selectedCountry ?? '';
      },
      child: Container(
        width: w * 0.875,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          style: MyFonts.textStyleForm12.copyWith(color: Colors.black),
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Country",
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
            prefixIcon: const Icon(Icons.location_on_outlined),
            suffixIcon: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value:
                    BlocProvider.of<SignUpCubit>(context).state.selectedCountry,
                icon: const Icon(Icons.arrow_drop_down),
                items: BlocProvider.of<SignUpCubit>(context)
                    .state
                    .countries
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  BlocProvider.of<SignUpCubit>(context).selectCountry(newValue);
                },
              ),
            ),
          ),
          onTap: () {
            // Open dropdown when the TextFormField is tapped
            FocusScope.of(context).requestFocus(FocusNode());
            Future.microtask(() => BlocProvider.of<SignUpCubit>(context)
                .selectCountry(BlocProvider.of<SignUpCubit>(context)
                    .state
                    .countries
                    .first));
          },
          readOnly:
              true, // Make it readonly since we only want to set it via the dropdown
        ),
      ),
    );
  }
}
