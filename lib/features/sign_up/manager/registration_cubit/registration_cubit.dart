import 'package:dio/dio.dart';
import 'package:finalproject/features/sign_up/data/registration_api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this.registraionApi) : super(RegistrationInitial());
  final RegistraionApi registraionApi;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController farmNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController cityController = TextEditingController();

  String regText = 'Register';
  registrationRequest() async {
    emit(RegistrationLoading());
    try {
      final Map<String, dynamic> body = toJson();
      await registraionApi.registrationRequest(body: body);
      emit(RegistrationSuccessed());
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        int statusCode = e.response!.statusCode!;
        String error = errorMsg(statusCode);
        emit(RegistrationFailed(errorMsg: error));
      } else {
        emit(RegistrationFailed(errorMsg: 'Oops something went wrong !!'));
      }
    }
  }

  String errorMsg(int statusCode) {
    if (statusCode >= 500) {
      return 'Server error occured , please try again later.';
    } else if (statusCode == 404) {
      return 'Email is exist , please change this email.';
    } else {
      return 'Oops something went wrong !!';
    }
  }

  Map<String, dynamic> toJson() => {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "flockName": farmNameController.text,
        "City": cityController.text,
      };
}
