import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';
import 'package:finalproject/features/profile/data/model/get_birds_model.dart';
import 'package:finalproject/features/profile/data/model/get_user_model.dart';

import '../../../core/utilities/logic/api_services.dart';

class ProfileApi extends WebServices {
  final userProfile = 'user/${SharedPrefUtil().getId()}';
  final numberOfBirds = 'birds';
  final logOut = 'auth/logout';
  Future<dynamic> getProfile() async {
    try {
      final Response response = await dio.get(
        userProfile,
        options: Options(validateStatus: (_) => true),
      );
      print(response.data);
      return GetUserModel.fromJson(response.data);
    } catch (err) {
      print('error is $err');
    }
  }

  Future<Map<String, dynamic>> updateProfile(
      {required Map<String, dynamic> body}) async {
    final Response response = await dio.put(
      userProfile,
      data: body,
      options: Options(validateStatus: (_) => true),
    );
    return response.data;
  }

  Future<dynamic> getNumberOfBirds() async {
    try {
      final Response response = await dio.get(numberOfBirds,
          options: Options(validateStatus: (_) => true));
      return GetBirdsModel.fromJson(response.data);
    } catch (err) {
      print(err);
    }
  }

  Future<void> signOut() async {
    await dio.post(logOut, options: Options(validateStatus: (_) => true));
  }
}
