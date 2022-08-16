import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mhm_portal/presentation/resources/assets_manager.dart';
import 'package:mhm_portal/presentation/resources/color_manager.dart';
import 'package:mhm_portal/presentation/resources/routes_manager.dart';
import 'package:mhm_portal/utils/custom_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  // saveLoginDetails() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool? _save = prefs.getBool("remember_me");
  //   var email = prefs.getString('email');
  //   var password = prefs.getString('password');
  //   print("$email");
  //   if (_save == true) {
  //     CustomNavigator().goNextScreenReplacement(context, Routes.mainRoute);
  //   } else {
  //     CustomNavigator().goNextScreenReplacement(context, Routes.loginRoute);
  //   }
  // }

  _startDelay() {
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save Remember Me
    bool? _save = prefs.getBool("remember_me");
    var email = prefs.getString('email');
    var password = prefs.getString('password');
    print("$email");
    if (_save == true) {
      CustomNavigator().goNextScreenReplacement(context, Routes.mainRoute);
    } else {
      CustomNavigator().goNextScreenReplacement(context, Routes.loginRoute);
    }

    // Skipp
    bool? isSkip = prefs.getBool('isSkipped');
    if (isSkip == true)
      CustomNavigator().goNextScreenReplacement(context, Routes.loginRoute);
    else {
      CustomNavigator()
          .goNextScreenReplacement(context, Routes.onBoardingRoute);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Image(image: AssetImage(ImageAssets.newLogo)))),
    );
  }
}
