// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

class CustomerEditModel {
  CustomerEditModel({
    required this.customer,
  });

  EditCustomer customer;

  factory CustomerEditModel.fromRawJson(String str) => CustomerEditModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerEditModel.fromJson(Map<String, dynamic> json) => CustomerEditModel(
    customer: EditCustomer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "customer": customer.toJson(),
  };
}

class EditCustomer {
  EditCustomer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  int? id;
  String firstName;
  String lastName;
  String email;
  String phone;

  factory EditCustomer.fromRawJson(String str) => EditCustomer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EditCustomer.fromJson(Map<String, dynamic> json) => EditCustomer(
    id: json["id"],
    firstName: json["firstName"]??'',
    lastName: json["lastName"]??'',
    email: json["email"]??'',
    phone: json["phone"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
  };
}
