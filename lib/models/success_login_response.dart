import 'dart:convert';

SuccessLoginResponse successLoginResponseFromJson(String str) =>
    SuccessLoginResponse.fromJson(json.decode(str));
String successLoginResponseToJson(SuccessLoginResponse data) =>
    json.encode(data.toJson());

class SuccessLoginResponse {
  SuccessLoginResponse({
    this.statusCode,
    this.codeEnum,
    this.statusMessage,
    this.responseObject,
  });

  SuccessLoginResponse.fromJson(dynamic json) {
    print('reponse print');
    print(json);
    statusCode = json['StatusCode'];
    print("Status Code");
    print(statusCode);
    codeEnum = json['CodeEnum'];
    statusMessage = json['StatusMessage'];
    responseObject = json['ResponseObject'] != null
        ? ResponseObject.fromJson(json['ResponseObject'])
        : null;
  }
  int? statusCode;
  int? codeEnum;
  String? statusMessage;
  ResponseObject? responseObject;
  SuccessLoginResponse copyWith({
    int? statusCode,
    int? codeEnum,
    String? statusMessage,
    ResponseObject? responseObject,
  }) =>
      SuccessLoginResponse(
        statusCode: statusCode ?? this.statusCode,
        codeEnum: codeEnum ?? this.codeEnum,
        statusMessage: statusMessage ?? this.statusMessage,
        responseObject: responseObject ?? this.responseObject,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StatusCode'] = statusCode;
    map['CodeEnum'] = codeEnum;
    map['StatusMessage'] = statusMessage;
    if (responseObject != null) {
      map['ResponseObject'] = responseObject?.toJson();
    }
    return map;
  }
}

ResponseObject responseObjectFromJson(String str) =>
    ResponseObject.fromJson(json.decode(str));
String responseObjectToJson(ResponseObject data) => json.encode(data.toJson());

class ResponseObject {
  ResponseObject({
    this.firstName,
    this.lastName,
    this.lastLoginDate,
    this.token,
  });

  ResponseObject.fromJson(dynamic json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    lastLoginDate = json['lastLoginDate'];
    token = json['Token'] != null ? Token.fromJson(json['Token']) : null;
  }
  String? firstName;
  String? lastName;
  String? lastLoginDate;
  Token? token;
  ResponseObject copyWith({
    String? firstName,
    String? lastName,
    String? lastLoginDate,
    Token? token,
  }) =>
      ResponseObject(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        lastLoginDate: lastLoginDate ?? this.lastLoginDate,
        token: token ?? this.token,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['lastLoginDate'] = lastLoginDate;
    if (token != null) {
      map['Token'] = token?.toJson();
    }
    return map;
  }
}

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));
String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    this.token,
    this.expiration,
    this.refreshToken,
  });

  Token.fromJson(dynamic json) {
    token = json['Token'];
    expiration = json['Expiration'];
    refreshToken = json['RefreshToken'];
  }
  String? token;
  String? expiration;
  dynamic refreshToken;
  Token copyWith({
    String? token,
    String? expiration,
    dynamic refreshToken,
  }) =>
      Token(
        token: token ?? this.token,
        expiration: expiration ?? this.expiration,
        refreshToken: refreshToken ?? this.refreshToken,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Token'] = token;
    map['Expiration'] = expiration;
    map['RefreshToken'] = refreshToken;
    return map;
  }
}
