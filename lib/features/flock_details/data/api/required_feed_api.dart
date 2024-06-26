import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/api_services.dart';
import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';

class RequiredFeedApi extends WebServices {
  final String url = 'birds/food/';
  String token = SharedPrefUtil().getToken()!;

  getRequiredFeed(String flockId) async {
    dio.options.headers['Cookie'] = 'accessToken=$token';
    final Response response = await dio.get('$url$flockId');
    log(response.data["feedWithoutWater"].toString());
    return response.data["feedWithoutWater"];
  }
}
