import 'package:bloc/bloc.dart';
import 'package:finalproject/core/utilities/statics.dart';
import 'package:finalproject/features/login/data/login_api.dart';
import 'package:finalproject/features/login/manager/cubit/cubit/login_cubit_cubit.dart';
import 'package:finalproject/features/login/presentation/login_screen.dart';
import 'package:finalproject/features/profile/data/model/get_birds_model.dart';
import 'package:finalproject/features/profile/data/profile_api.dart';
import 'package:finalproject/features/profile/data/model/get_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utilities/logic/shared_pref_util.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ManagerInitial());
  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);
  ProfileApi profileApi = ProfileApi();
  GetUserModel getUserModel = GetUserModel();
  GetBirdsModel getBirdsModel = GetBirdsModel();
  getProfile() async {
    emit(GetProfileLoading());
    await profileApi.getProfile().then((value) async {
      getUserModel = value;
      await getBirds();
      emit(GetProfileSuccess());
    }).catchError((error) {
      emit(GetProfileFailed());
    });
  }

  getBirds() async {
    await profileApi.getNumberOfBirds().then((value) {
      getBirdsModel = value;
    }).catchError((error) {
      print(error);
    });
  }

  updateProfile() async {
    profileApi.updateProfile(body: {
      'firstName': editFirstName.text,
      'lastName': editLastName.text,
      'email': editEmail.text,
      'flockName': editFarm.text
    }).then((value) {
      emit(UpdatedSuccess());
    }).catchError((error) {
      emit(UpdatedFailed());
    });
  }

  signOut(BuildContext context) async {
    try {
      await profileApi.signOut();
      SharedPrefUtil().removeToken();
      emit(SignOutSuccess());
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => LoginCubit(LoginApi()),
                    child: const LoginScreen(),
                  )),
          (route) => false);
    } catch (err) {
      emit(SignOutFailed());
    }
  }
}
