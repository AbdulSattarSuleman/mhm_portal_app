import 'package:flutter/material.dart';

class CustomNavigator {
  goNextScreen(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  goNextScreenReplacement(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}
