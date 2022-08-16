class StudentList {
  StudentList({
    required this.address,
    required this.contactNumber,
    required this.dob,
    required this.fatherCnic,
    required this.fatherName,
    required this.joiningDate,
    required this.registerationNo,
    required this.studentName,
    required this.urduAddress,
    required this.urduFatherName,
    required this.urduStudentName,
  });

  StudentList.fromJson(dynamic json) {
    address = json['Address'];
    contactNumber = json['ContactNumber'];
    dob = json['DOB'];
    fatherCnic = json['FatherCnic'];
    fatherName = json['FatherName'];
    joiningDate = json['JoiningDate'];
    registerationNo = json['RegisterationNo'];
    studentName = json['StudentName'];
    urduAddress = json['UrduAddress'];
    urduFatherName = json['UrduFatherName'];
    urduStudentName = json['UrduStudentName'];
  }
  String address;
  dynamic contactNumber;
  dynamic dob;
  dynamic fatherCnic;
  String fatherName;
  String joiningDate;
  int registerationNo;
  String studentName;
  String urduAddress;
  String urduFatherName;
  String urduStudentName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Address'] = address;
    map['ContactNumber'] = contactNumber;
    map['DOB'] = dob;
    map['FatherCnic'] = fatherCnic;
    map['FatherName'] = fatherName;
    map['JoiningDate'] = joiningDate;
    map['RegisterationNo'] = registerationNo;
    map['StudentName'] = studentName;
    map['UrduAddress'] = urduAddress;
    map['UrduFatherName'] = urduFatherName;
    map['UrduStudentName'] = urduStudentName;
    return map;
  }
}
