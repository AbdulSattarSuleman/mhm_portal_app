class ResponseObject {
  ResponseObject({
      this.studentList, 
      this.totalPage,});

  ResponseObject.fromJson(dynamic json) {
    if (json['StudentList'] != null) {
      studentList = [];
      json['StudentList'].forEach((v) {
        studentList.add(StudentList.fromJson(v));
      });
    }
    totalPage = json['TotalPage'];
  }
  List<StudentList> studentList;
  int totalPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (studentList != null) {
      map['StudentList'] = studentList.map((v) => v.toJson()).toList();
    }
    map['TotalPage'] = totalPage;
    return map;
  }

}