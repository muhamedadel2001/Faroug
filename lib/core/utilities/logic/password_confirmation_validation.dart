import 'package:finalproject/core/utilities/logic/validation_text_field.dart';
import 'package:finalproject/features/sign_up/manager/registration_cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmPasswordValidation implements ValidationTextField {
  final String errorMsg = 'passwords are not identical';
  final BuildContext ctx;
  late TextEditingController password;
  ConfirmPasswordValidation(this.ctx) {
    password = BlocProvider.of<RegistrationCubit>(ctx).passwordController;
  }
  @override
  String? validation(String? val) {
    if (val == null || val.isEmpty || val != password.text) {
      return errorMsg;
    }
    return null;
  }
}
