// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mhm_portal/presentation/resources/routes_manager.dart';
import 'package:mhm_portal/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);
  MyApp._internal(); //Private Named Constructor
  int appState = 0;
  static final MyApp instance =
      MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; //factory for class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoutes,
      initialRoute: Routes.splashRoute,
      debugShowCheckedModeBanner: false,
      // home: FeatureSCreen(),
      theme: getApplicationTheme(),
    );
  }
}
