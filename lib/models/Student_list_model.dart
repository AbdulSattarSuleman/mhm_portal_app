import 'ResponseObject.dart';

class StudentListModel {
  StudentListModel({
      this.statusCode, 
      this.codeEnum, 
      this.statusMessage, 
      this.responseObject,});

  StudentListModel.fromJson(dynamic json) {
    statusCode = json['StatusCode'];
    codeEnum = json['CodeEnum'];
    statusMessage = json['StatusMessage'];
    responseObject = json['ResponseObject'] != null ? ResponseObject.fromJson(json['ResponseObject']) : null;
  }
  int statusCode;
  int codeEnum;
  dynamic statusMessage;
  ResponseObject responseObject;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = statusCode;
    map['CodeEnum'] = codeEnum;
    map['StatusMessage'] = statusMessage;
    if (responseObject != null) {
      map['ResponseObject'] = responseObject.toJson();
    }
    return map;
  }

}