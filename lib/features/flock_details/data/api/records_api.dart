import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/api_services.dart';
import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';

class RecordsApi extends WebServices {
  final String url;
  String token = SharedPrefUtil().getToken()!;
  RecordsApi(this.url);

  Future<Map<String, dynamic>> getRecord() async {
    dio.options.headers['Cookie'] = 'accessToken=$token';
    final Response response = await dio.get(url);
    return response.data;
  }

    Future<Map<String, dynamic>> deleteRecord() async {
    dio.options.headers['Cookie'] = 'accessToken=$token';
    final Response response = await dio.delete(url);
    return response.data;
  }
  
}
