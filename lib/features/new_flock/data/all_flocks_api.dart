import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/api_services.dart';
import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';

class AllFlocksApi extends WebServices {
  String url = 'flock/';
  String token = SharedPrefUtil().getToken()!;

  getAllFlocks() async {
    dio.options.headers['Cookie'] = 'accessToken=$token';
    final Response response = await dio.get(url);
    return response.data;
  }
}
