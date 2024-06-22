import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';
import 'package:finalproject/features/login/data/login_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit(this.loginApi) : super(LoginCubitInitial());
  final LoginApi loginApi;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String loginText = 'Login';
  loginRequest() async {
    emit(LoginLoading());
    try {
      final Map<String, dynamic> body = toJson();
      Map<String, dynamic> data = await loginApi.loginRequest(body: body);
      String token = data['token'];
      String id = data['details']['_id'];
      String city = data['details']['City'];
      emit(LoginSuccessed(token, id, city));
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        int statusCode = e.response!.statusCode!;
        String error = errorMsg(statusCode);
        emit(LoginFailed(errorMsg: error));
      } else {
        emit(LoginFailed(errorMsg: 'Oops something went wrong !!'));
      }
    }
  }

  String errorMsg(int statusCode) {
    if (statusCode >= 500) {
      return 'Server error occured , please try again later.';
    } else if (statusCode == 401) {
      return 'Username or password is incorrect';
    } else {
      return 'Oops something went wrong !!';
    }
  }

  Map<String, dynamic> toJson() =>
      {"email": emailController.text, "password": passwordController.text};
}
