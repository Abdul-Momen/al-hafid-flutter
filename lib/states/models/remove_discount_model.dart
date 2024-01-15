// To parse this JSON data, do
//
//     final removeDiscountModel = removeDiscountModelFromJson(jsonString);

import 'dart:convert';

class RemoveDiscountModel {
  CheckoutDiscountCodeRemove checkoutDiscountCodeRemove;

  RemoveDiscountModel({
    required this.checkoutDiscountCodeRemove,
  });

  factory RemoveDiscountModel.fromRawJson(String str) => RemoveDiscountModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RemoveDiscountModel.fromJson(Map<String, dynamic> json) => RemoveDiscountModel(
    checkoutDiscountCodeRemove: CheckoutDiscountCodeRemove.fromJson(json["checkoutDiscountCodeRemove"]),
  );

  Map<String, dynamic> toJson() => {
    "checkoutDiscountCodeRemove": checkoutDiscountCodeRemove.toJson(),
  };
}

class CheckoutDiscountCodeRemove {
  Checkout checkout;
  List<dynamic> checkoutUserErrors;

  CheckoutDiscountCodeRemove({
    required this.checkout,
    required this.checkoutUserErrors,
  });

  factory CheckoutDiscountCodeRemove.fromRawJson(String str) => CheckoutDiscountCodeRemove.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckoutDiscountCodeRemove.fromJson(Map<String, dynamic> json) => CheckoutDiscountCodeRemove(
    checkout: Checkout.fromJson(json["checkout"]),
    checkoutUserErrors: List<dynamic>.from(json["checkoutUserErrors"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "checkout": checkout.toJson(),
    "checkoutUserErrors": List<dynamic>.from(checkoutUserErrors.map((x) => x)),
  };
}

class Checkout {
  String id;
  TotalPrice totalPrice;

  Checkout({
    required this.id,
    required this.totalPrice,
  });

  factory Checkout.fromRawJson(String str) => Checkout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
    id: json["id"],
    totalPrice: TotalPrice.fromJson(json["totalPrice"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "totalPrice": totalPrice.toJson(),
  };
}

class TotalPrice {
  String amount;

  TotalPrice({
    required this.amount,
  });

  factory TotalPrice.fromRawJson(String str) => TotalPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TotalPrice.fromJson(Map<String, dynamic> json) => TotalPrice(
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
  };
}
