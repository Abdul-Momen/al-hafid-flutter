// To parse this JSON data, do
//
//     final addAddressResponse = addAddressResponseFromJson(jsonString);

import 'dart:convert';

class AddAddressResponse {
  AddAddressResponse({
    required this.customerAddressCreate,
  });

  CustomerAddressCreate customerAddressCreate;

  factory AddAddressResponse.fromRawJson(String str) => AddAddressResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddAddressResponse.fromJson(Map<String, dynamic> json) => AddAddressResponse(
    customerAddressCreate: CustomerAddressCreate.fromJson(json["customerAddressCreate"]),
  );

  Map<String, dynamic> toJson() => {
    "customerAddressCreate": customerAddressCreate.toJson(),
  };
}

class CustomerAddressCreate {
  CustomerAddressCreate({
    required this.customerAddress,
    required this.customerUserErrors,
  });

  CustomerAddress customerAddress;
  List<CustomerUserError> customerUserErrors;

  factory CustomerAddressCreate.fromRawJson(String str) => CustomerAddressCreate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerAddressCreate.fromJson(Map<String, dynamic> json) => CustomerAddressCreate(
    customerAddress: CustomerAddress.fromJson(json["customerAddress"]??{}),
    customerUserErrors: List<CustomerUserError>.from(json["customerUserErrors"]??[].map((x) => CustomerUserError.fromJson(x))??[]),
  );

  Map<String, dynamic> toJson() => {
    "customerAddress": customerAddress.toJson(),
    "customerUserErrors": List<dynamic>.from(customerUserErrors.map((x) => x.toJson())),
  };
}

class CustomerAddress {
  CustomerAddress({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  String id;
  String firstName;
  String lastName;
  String phone;

  factory CustomerAddress.fromRawJson(String str) => CustomerAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerAddress.fromJson(Map<String, dynamic> json) => CustomerAddress(
    id: json["id"]??'',
    firstName: json["firstName"]??'',
    lastName: json["lastName"]??'',
    phone: json["phone"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
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
    code: json["code"]??"",
    field: List<String>.from(json["field"].map((x) => x)??[]),
    message: json["message"]??'',
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "field": List<dynamic>.from(field.map((x) => x)),
    "message": message,
  };
}
