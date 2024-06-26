import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/logic/api_services.dart';
import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';
import 'package:flutter/material.dart';

class AddApi extends WebServices {
  final String url;
  String token = SharedPrefUtil().getToken()!;
  AddApi(this.url);
  createRecord(Map<String, dynamic> body) async {
    log(token);
    dio.options.headers['Cookie'] = 'accessToken=$token';
    final Response response = await dio.post(url, data: body);
    if (response.data['notifcation'] == true) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: 1,
        channelKey: 'basic key',
        title: 'Alert From Inventory',
        body: 'Check Inventory Your Item running out  of ',
        displayOnForeground: true,
        displayOnBackground: true,
      ));
    }
    log(response.data["message"].toString());
    return response.data["message"];
  }
}
