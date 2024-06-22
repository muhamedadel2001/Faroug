import 'package:finalproject/core/utilities/app_router.dart';
import 'package:finalproject/core/utilities/logic/bloc_observer.dart';
import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/core/utilities/logic/shared_pref_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefUtil().initPrefs();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
