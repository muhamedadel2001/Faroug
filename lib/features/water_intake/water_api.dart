import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/api_services.dart';

class WaterApi extends WebServices {
  String url = 'birds/water';
  Future<Map<String, dynamic>> getWaterInTake() async {
    final Response response = await dio.get(url);
    log(response.data.toString());
    return response.data;
  }
}
