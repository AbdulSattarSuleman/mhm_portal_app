// {{url}}/api/Student/List

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mhm_portal/utils/api_urls.dart';

class StudentListApi {
  Future<http.Response> getStudentListData(String token) {
    return http.post(
      Uri.parse(APIUrls.studentListApiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'token': token,
      }),
    );
  }
}
