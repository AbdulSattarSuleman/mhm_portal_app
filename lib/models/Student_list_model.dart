class Api_student_list_model {
  int? statusCode;
  int? codeEnum;
  String? statusMessage;
  ResponseObject? responseObject;

  Api_student_list_model(
      {this.statusCode,
      this.codeEnum,
      this.statusMessage,
      this.responseObject});

  Api_student_list_model.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    codeEnum = json['CodeEnum'];
    statusMessage = json['StatusMessage'];
    responseObject = json['ResponseObject'] != null
        ? new ResponseObject.fromJson(json['ResponseObject'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data2 = new Map<String, dynamic>();
    data2['StatusCode'] = this.statusCode;
    data2['CodeEnum'] = this.codeEnum;
    data2['StatusMessage'] = this.statusMessage;
    if (this.responseObject != null) {
      data2['ResponseObject'] = this.responseObject!.toJson();
    }
    return data2;
  }
}

class ResponseObject {
  List<StudentList>? studentList;
  int? totalPage;

  ResponseObject({this.studentList, this.totalPage});

  ResponseObject.fromJson(Map<String, dynamic> json) {
    if (json['StudentList'] != null) {
      studentList = <StudentList>[];
      json['StudentList'].forEach((v) {
        studentList!.add(new StudentList.fromJson(v));
      });
    }
    totalPage = json['TotalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.studentList != null) {
      data['StudentList'] = this.studentList!.map((v) => v.toJson()).toList();
    }
    data['TotalPage'] = this.totalPage;
    return data;
  }
}

class StudentList {
  String? address;
  String? contactNumber;
  String? dOB;
  String? fatherCnic;
  String? fatherName;
  String? joiningDate;
  int? registerationNo;
  String? studentName;
  String? urduAddress;
  String? urduFatherName;
  String? urduStudentName;

  StudentList(
      {this.address,
      this.contactNumber,
      this.dOB,
      this.fatherCnic,
      this.fatherName,
      this.joiningDate,
      this.registerationNo,
      this.studentName,
      this.urduAddress,
      this.urduFatherName,
      this.urduStudentName});

  StudentList.fromJson(Map<String, dynamic> json) {
    address = json['Address'];
    contactNumber = json['ContactNumber'];
    dOB = json['DOB'];
    fatherCnic = json['FatherCnic'];
    fatherName = json['FatherName'];
    joiningDate = json['JoiningDate'];
    registerationNo = json['RegisterationNo'];
    studentName = json['StudentName'];
    urduAddress = json['UrduAddress'];
    urduFatherName = json['UrduFatherName'];
    urduStudentName = json['UrduStudentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Address'] = this.address;
    data['ContactNumber'] = this.contactNumber;
    data['DOB'] = this.dOB;
    data['FatherCnic'] = this.fatherCnic;
    data['FatherName'] = this.fatherName;
    data['JoiningDate'] = this.joiningDate;
    data['RegisterationNo'] = this.registerationNo;
    data['StudentName'] = this.studentName;
    data['UrduAddress'] = this.urduAddress;
    data['UrduFatherName'] = this.urduFatherName;
    data['UrduStudentName'] = this.urduStudentName;
    return data;
  }
}
