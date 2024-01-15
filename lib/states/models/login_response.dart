// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromMap(jsonString);

import 'dart:convert';

class LoginResponse {
  LoginResponse({
    this.data,
  });

  LoginData? data;

  factory LoginResponse.fromJson(String str) => LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
    data: json["data"] == null ? null : LoginData.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data?.toMap(),
  };
}

class LoginData {
  LoginData({
    this.customerAccessTokenCreate,
  });

  CustomerAccessTokenCreate? customerAccessTokenCreate;

  factory LoginData.fromJson(String str) => LoginData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginData.fromMap(Map<String, dynamic> json) => LoginData(
    customerAccessTokenCreate: json["customerAccessTokenCreate"] == null ? null : CustomerAccessTokenCreate.fromMap(json["customerAccessTokenCreate"]),
  );

  Map<String, dynamic> toMap() => {
    "customerAccessTokenCreate": customerAccessTokenCreate?.toMap(),
  };
}

class CustomerAccessTokenCreate {
  CustomerAccessTokenCreate({
    this.customerUserErrors,
    this.customerAccessToken,
  });

  List<dynamic>? customerUserErrors;
  CustomerAccessToken? customerAccessToken;

  factory CustomerAccessTokenCreate.fromJson(String str) => CustomerAccessTokenCreate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerAccessTokenCreate.fromMap(Map<String, dynamic> json) => CustomerAccessTokenCreate(
    customerUserErrors: json["customerUserErrors"] == null ? [] : List<dynamic>.from(json["customerUserErrors"]!.map((x) => x)),
    customerAccessToken: json["customerAccessToken"] == null ? null : CustomerAccessToken.fromMap(json["customerAccessToken"]),
  );

  Map<String, dynamic> toMap() => {
    "customerUserErrors": customerUserErrors == null ? [] : List<dynamic>.from(customerUserErrors!.map((x) => x)),
    "customerAccessToken": customerAccessToken?.toMap(),
  };
}

class CustomerAccessToken {
  CustomerAccessToken({
    this.accessToken,
    this.expiresAt,
  });

  String? accessToken;
  DateTime? expiresAt;

  factory CustomerAccessToken.fromJson(String str) => CustomerAccessToken.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerAccessToken.fromMap(Map<String, dynamic> json) => CustomerAccessToken(
    accessToken: json["accessToken"],
    expiresAt: json["expiresAt"] == null ? null : DateTime.parse(json["expiresAt"]),
  );

  Map<String, dynamic> toMap() => {
    "accessToken": accessToken,
    "expiresAt": expiresAt?.toIso8601String(),
  };
}
