// To parse this JSON data, do
//
//     final setShippingAddressResponse = setShippingAddressResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SetShippingAddressResponse {
  SetShippingAddressResponse({
    required this.checkoutShippingAddressUpdateV2,
  });

  CheckoutShippingAddressUpdateV2 checkoutShippingAddressUpdateV2;

  factory SetShippingAddressResponse.fromRawJson(String str) => SetShippingAddressResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SetShippingAddressResponse.fromJson(Map<String, dynamic> json) => SetShippingAddressResponse(
    checkoutShippingAddressUpdateV2: CheckoutShippingAddressUpdateV2.fromJson(json["checkoutShippingAddressUpdateV2"]),
  );

  Map<String, dynamic> toJson() => {
    "checkoutShippingAddressUpdateV2": checkoutShippingAddressUpdateV2.toJson(),
  };
}

class CheckoutShippingAddressUpdateV2 {
  CheckoutShippingAddressUpdateV2({
    required this.checkoutUserErrors,
    required this.checkout,
  });

  List<CheckoutUserError> checkoutUserErrors;
  Checkout checkout;

  factory CheckoutShippingAddressUpdateV2.fromRawJson(String str) => CheckoutShippingAddressUpdateV2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckoutShippingAddressUpdateV2.fromJson(Map<String, dynamic> json) => CheckoutShippingAddressUpdateV2(
    checkoutUserErrors: List<CheckoutUserError>.from(json["checkoutUserErrors"].map((x) => CheckoutUserError.fromJson(x))),
    checkout: Checkout.fromJson(json["checkout"]),
  );

  Map<String, dynamic> toJson() => {
    "checkoutUserErrors": List<dynamic>.from(checkoutUserErrors.map((x) => x)),
    "checkout": checkout.toJson(),
  };
}

class Checkout {
  Checkout({
    required this.id,
    required this.totalPrice,
    required this.shippingAddress,
  });

  String id;
  TotalPrice totalPrice;
  ShippingAddress shippingAddress;

  factory Checkout.fromRawJson(String str) => Checkout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
    id: json["id"],
    totalPrice: TotalPrice.fromJson(json["totalPrice"]),
    shippingAddress: ShippingAddress.fromJson(json["shippingAddress"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "totalPrice": totalPrice.toJson(),
    "shippingAddress": shippingAddress.toJson(),
  };
}

class ShippingAddress {
  ShippingAddress({
    required this.firstName,
    required this.lastName,
    required this.address1,
    required this.province,
    required this.country,
    required this.zip,
  });

  String firstName;
  String lastName;
  String address1;
  dynamic province;
  String country;
  String zip;

  factory ShippingAddress.fromRawJson(String str) => ShippingAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
    firstName: json["firstName"]??'',
    lastName: json["lastName"]??'',
    address1: json["address1"]??'',
    province: json["province"],
    country: json["country"]??'',
    zip: json["zip"]??'',
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "address1": address1,
    "province": province,
    "country": country,
    "zip": zip,
  };
}

class TotalPrice {
  TotalPrice({
    required this.amount,
  });

  String amount;

  factory TotalPrice.fromRawJson(String str) => TotalPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TotalPrice.fromJson(Map<String, dynamic> json) => TotalPrice(
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
  };
}

class CheckoutUserError {
  CheckoutUserError({
    required this.code,
    required this.field,
    required this.message,
  });

  String code;
  List<String> field;
  String message;

  factory CheckoutUserError.fromRawJson(String str) => CheckoutUserError.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckoutUserError.fromJson(Map<String, dynamic> json) => CheckoutUserError(
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
