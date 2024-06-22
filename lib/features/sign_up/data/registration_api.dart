import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/api_services.dart';

class RegistraionApi extends WebServices {
  final url = 'auth/register';
  Future<Map<String, dynamic>> registrationRequest(
      {required Map<String, dynamic> body}) async {
    final Response response = await dio.post(
      url,
      data: body,
    );
    return response.data;
  }
}
