import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mhm_portal/models/Student_list_model.dart';
import 'package:mhm_portal/models/success_login_response.dart';
import 'package:mhm_portal/services/shared_preferences.dart';
import 'package:mhm_portal/utils/api_urls.dart';

import '../presentation/resources/routes_manager.dart';
import '../utils/custom_navigator.dart';

class ApiClient {
  final Dio _dio = Dio();

  // Student API List Information Funcationality
  Future<dynamic> fetchStudentListInfo(BuildContext? context) async {
    try {
      String tokenValue = SharedPreferncesServices.getData('token');
      dynamic response =
          await Post(APIUrls.studentListApiUrl, {'token': tokenValue});
      var studentApiResponse = Api_student_list_model.fromJson(response);
      print(studentApiResponse);

      if (studentApiResponse.statusCode == 0) {
        if (studentApiResponse.responseObject != null) {
          var resultObj = studentApiResponse.responseObject;
          List<StudentList>? singleStudentDetail = resultObj!.studentList;
          int studentListLength = singleStudentDetail!.length;
          print(studentListLength);

          print(tokenValue);
          // SharedPreferncesServices.setData('token', token!);

        } else {
          print("Failed APi Response");
          print(studentApiResponse.statusCode);
          ScaffoldMessenger.of(context!).showSnackBar(
              SnackBar(content: Text('${studentApiResponse.statusMessage}')));
        }
        return response.data;
      }
    } on DioError catch (e) {
      print(e.response!.data);
      return e.response!.data;
    }
  }

// Admin Login Api Functionality
  Future<Response> AdminLogin(
      String email, String password, BuildContext? context) async {
    // Implement User Login
    try {
      dynamic response = await Post(
        APIUrls.loginApiUrl, {'email': email, 'password': password},
        // queryParameters:
      );
      var sucessLoginResponse = SuccessLoginResponse.fromJson(response);
      print("Login Success Response");

      print(sucessLoginResponse);
      if (sucessLoginResponse.statusCode == 0) {
        if (sucessLoginResponse.responseObject != null) {
          var resultObj = sucessLoginResponse.responseObject;
          var userName = resultObj!.firstName! + " " + resultObj.lastName!;
          var tokenObj = resultObj.token;
          var token = tokenObj!.token;
          var refreshToken = tokenObj.refreshToken;
          var expiry = tokenObj.expiration;

          // SharedPreferences.getInstance().then((prefs) {
          //   prefs.setString("username", userName);
          //   prefs.setString('token', token!);
          //   prefs.setString('refreshtoken', refreshToken);
          //   prefs.setString('expiry', expiry!);
          // });

          SharedPreferncesServices.setData("username", userName);
          SharedPreferncesServices.setData('token', token!);
          SharedPreferncesServices.setData('refreshtoken', refreshToken);
          SharedPreferncesServices.setData('expiry', expiry!);
        }
        print('if condition runing');
        // SuccessLoginResponse()
        // if (response.statusCode == 200) {
        CustomNavigator().goNextScreenReplacement(context!, Routes.mainRoute);
        print(sucessLoginResponse.statusCode);
        // String? firstName = sucessLoginResponse.responseObject!.firstName;
        // String? lastName = sucessLoginResponse.responseObject!.lastName;
        // print(firstName);
        // MainView(
        //   firstName: sucessLoginResponse.responseObject!.firstName,
        //   lastName: sucessLoginResponse.responseObject!.lastName,
        // );
      } else {
        print("Failed");
        print(sucessLoginResponse.statusCode);
        ScaffoldMessenger.of(context!).showSnackBar(
            SnackBar(content: Text('${sucessLoginResponse.statusMessage}')));
      }
      print(response);
      // print(sucessLoginResponse.responseObject!.lastName);
      // return successful user data json object
      return response.data;
    } on DioError catch (e) {
      // returns the error object if any
      print(e.response!.data);
      return e.response!.data;
    }
  }

  dynamic Post(
    String url,
    Map<String, String> requestObj,
  ) async {
    // Implement User Login
    try {
      Response response = await _dio.post(
        url, data: requestObj,

        // queryParameters:
      );
      // print(response.statusCode);
      // print(response);

      // print("object response : ${sucessLoginResponse} ");
      // print('after Status Code');
      // print(sucessLoginResponse.statusCode);

      // return successful user data json object
      return response.data;
    } on DioError catch (e) {
      // returns the error object if any
      print(e.response!.data);
      return e.response!.data;
    }
  }

  Future<Response> getUserProfileData(String accesstoken) async {
    // Get User Profile Data
    try {
      Response response = await _dio.get(
        APIUrls.loginApiUrl,
        // options: Options(
        //   headers: {'Authorization': 'Bearer ${ACCESS_TOKEN}'},
        // ),
      );

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  // Future<Response> logout() async {
  //   // Implement user logout
  // }
}
