import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/api_services.dart';
import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';

class AnalysisApi extends WebServices {
  String token = SharedPrefUtil().getToken()!;
  

  Future<int> getTotalIncome(String flockId) async {
    dio.options.headers['Cookie'] = 'accessToken=$token';
    final Response response = await dio.get('inFin/$flockId');
     return response.data['Number'];
  }

  Future<int> getTotalExpenses(String flockId) async {
    dio.options.headers['Cookie'] = 'accessToken=$token';
    final Response response = await dio.get('exFin/$flockId');
    return response.data['Number'];
  }
}
