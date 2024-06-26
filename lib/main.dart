import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:finalproject/core/utilities/app_router.dart';
import 'package:finalproject/core/utilities/logic/bloc_observer.dart';
import 'package:finalproject/core/utilities/logic/notification_config.dart';
import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      'resource://drawable/notification',
      [
        NotificationChannel(
          channelKey: 'basic key',
          channelName: 'test chanel',
          channelDescription: 'notification for test',
          playSound: true,
          channelShowBadge: true,
          importance: NotificationImportance.High,
          onlyAlertOnce: true,
          criticalAlerts: true,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic key', channelGroupName: 'test chanel'),
      ],
      debug: true);

  await Future.delayed(const Duration(milliseconds: 150));
  await SharedPrefUtil().initPrefs();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
          if (!isAllowed)
            {AwesomeNotifications().requestPermissionToSendNotifications()}
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveCalc.getInstance(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
