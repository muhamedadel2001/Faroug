import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';

class WebServices {
  late Dio dio;
  final String baseUrl = 'https://gradproject-e6s8.onrender.com/api/';
  WebServices() {
    final BaseOptions baseOptions = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Cookie': "accessToken=${SharedPrefUtil().getToken()}",
        });

    dio = Dio(baseOptions);
  }
}
