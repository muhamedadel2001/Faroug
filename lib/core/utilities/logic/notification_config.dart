import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:finalproject/features/inventory/presentation/inventory_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Noti {
  static Future<void> onActionReceive(
      ReceivedAction receive, BuildContext context) async {
    print('onActionReceive');
    final payload = receive.payload ?? {};
    if (payload['navigate'] == true) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const InventoryScreen()));
    }
  }
}
