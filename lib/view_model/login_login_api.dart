import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mhm_portal/presentation/resources/routes_manager.dart';
import 'package:mhm_portal/utils/api_urls.dart';
import 'package:mhm_portal/utils/custom_navigator.dart';

class NewApiCLient {
  BuildContext? context;
  Future<http.Response> loginRequest(String email, String password) async {
    final Uri _loginUri = Uri.parse(APIUrls.loginApiUrl);
    var response = await http.post(_loginUri,
        headers: {"Content-Type": "application/json"},
        body: {"email": email, "password": password});

    if (response.statusCode == 0) {
      CustomNavigator().goNextScreenReplacement(context!, Routes.mainRoute);
      print(response.statusCode);
    } else {
      print("Failed");
      print(response.statusCode);
    }

    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
}
