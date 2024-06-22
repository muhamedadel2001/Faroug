import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/api_services.dart';

class LoginApi extends WebServices {
  final url = 'auth/login';
  Future<Map<String, dynamic>> loginRequest(
      {required Map<String, dynamic> body}) async {
    final Response response = await dio.post(
      url,
      data: body,
    );
    return response.data;
  }
}



