// To parse this JSON data, do
//
//     final resetResponse = resetResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ResetResponse {
    ResetResponse({
        required this.customerRecover,
    });

    CustomerRecover customerRecover;

    factory ResetResponse.fromRawJson(String str) => ResetResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ResetResponse.fromJson(Map<String, dynamic> json) => ResetResponse(
        customerRecover: CustomerRecover.fromJson(json["customerRecover"]),
    );

    Map<String, dynamic> toJson() => {
        "customerRecover": customerRecover.toJson(),
    };
}

class CustomerRecover {
    CustomerRecover({
        required this.customerUserErrors,
    });

    List<CustomerUserError> customerUserErrors;

    factory CustomerRecover.fromRawJson(String str) => CustomerRecover.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CustomerRecover.fromJson(Map<String, dynamic> json) => CustomerRecover(
        customerUserErrors: List<CustomerUserError>.from(json["customerUserErrors"].map((x) => CustomerUserError.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "customerUserErrors": List<dynamic>.from(customerUserErrors.map((x) => x.toJson())),
    };
}

class CustomerUserError {
    CustomerUserError({
        required this.code,
        required this.field,
        required this.message,
    });

    String code;
    List<String> field;
    String message;

    factory CustomerUserError.fromRawJson(String str) => CustomerUserError.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CustomerUserError.fromJson(Map<String, dynamic> json) => CustomerUserError(
        code: json["code"],
        field: List<String>.from(json["field"].map((x) => x)),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "field": List<dynamic>.from(field.map((x) => x)),
        "message": message,
    };
}
