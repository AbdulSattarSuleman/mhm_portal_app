import 'package:flutter/material.dart';
import 'package:mhm_portal/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var email = prefs.getString('email');
  // var password = prefs.getString('password');
  // print(email);
  runApp(MyApp());
}
