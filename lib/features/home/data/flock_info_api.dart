import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/api_services.dart';
import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';

class FlockInfoApi extends WebServices {
  String token = SharedPrefUtil().getToken()!;

  Future<void> updateFlockStatus(String flockId, bool status) async {
    dio.options.headers['Cookie'] = 'accessToken=$token';
    await dio.put('flock/$flockId', data: {'Active': status});
  }

  Future<int> getMortalityNom(String flockId) async {
    dio.options.headers['Cookie'] = 'accessToken=$token';
    final Response response = await dio.get('numOfDead/$flockId');
    log(response.data.toString());
    return response.data['Number'];
  }
}
