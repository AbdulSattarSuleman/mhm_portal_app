import 'package:flutter/material.dart';
import 'package:mhm_portal/presentation/forgot-password/forgot_password_view.dart';
import 'package:mhm_portal/presentation/login/login_view.dart';
import 'package:mhm_portal/presentation/main/main_view.dart';
import 'package:mhm_portal/presentation/main/student-list/std_detail_info_vew.dart';
import 'package:mhm_portal/presentation/main/student-list/student_list_view.dart';
import 'package:mhm_portal/presentation/onboarding/onboarding_view.dart';
import 'package:mhm_portal/presentation/register/register_view.dart';
import 'package:mhm_portal/presentation/resources/strings_manager.dart';
import 'package:mhm_portal/presentation/splash/splash_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String studentListRoute = '/stdList';
  static const String studenDetailInfoRoute = '/studentDetailInfo';
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.studentListRoute:
        return MaterialPageRoute(builder: (_) => StudentListView());
      case Routes.studenDetailInfoRoute:
        return MaterialPageRoute(builder: (_) => StudentDetailInfoView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text(AppStrings.noRouteFound)),
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      );
    });
  }
}
