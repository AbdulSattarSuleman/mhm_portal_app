import 'package:flutter/material.dart';
import 'package:mhm_portal/view_model/login_api.dart';

import '../../../../models/Student_list_model.dart';
import '../../../../models/Student_list_model.dart';

class StudentListViaApi extends StatelessWidget {
  const StudentListViaApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
      ),
      body: FutureBuilder<dynamic<Api_student_list_model>>(
        future: ApiClient().fetchStudentListInfo(context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("En Error Occurred"),
            );
          } else if (snapshot.hasData) {
            return StudentCardInfo();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
