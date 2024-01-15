// To parse this JSON data, do
//
//     final addNoteResponse = addNoteResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AddNoteResponse {
  AddNoteResponse({
    required this.cartNoteUpdate,
  });

  CartNoteUpdate cartNoteUpdate;

  factory AddNoteResponse.fromRawJson(String str) => AddNoteResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddNoteResponse.fromJson(Map<String, dynamic> json) => AddNoteResponse(
    cartNoteUpdate: CartNoteUpdate.fromJson(json["cartNoteUpdate"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "cartNoteUpdate": cartNoteUpdate.toJson(),
  };
}

class CartNoteUpdate {
  CartNoteUpdate({
    required this.cart,
    required this.userErrors,
  });

  Cart cart;
  List<UserError> userErrors;

  factory CartNoteUpdate.fromRawJson(String str) => CartNoteUpdate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartNoteUpdate.fromJson(Map<String, dynamic> json) => CartNoteUpdate(
    cart: Cart.fromJson(json["cart"]??{}),
    userErrors: List<UserError>.from(json["userErrors"].map((x) => UserError.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cart": cart.toJson(),
    "userErrors": List<dynamic>.from(userErrors.map((x) => x.toJson())),
  };
}

class Cart {
  Cart({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.note,
    required this.lines,
    required this.attributes,
    required this.cost,
    required this.buyerIdentity,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String note;
  Lines lines;
  List<dynamic> attributes;
  Cost cost;
  BuyerIdentity buyerIdentity;

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"]??'',
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    note: json["note"],
    lines: Lines.fromJson(json["lines"]),
    attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
    cost: Cost.fromJson(json["cost"]),
    buyerIdentity: BuyerIdentity.fromJson(json["buyerIdentity"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "note": note,
    "lines": lines.toJson(),
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
    "cost": cost.toJson(),
    "buyerIdentity": buyerIdentity.toJson(),
  };
}

class BuyerIdentity {
  BuyerIdentity({
    required this.email,
    required this.phone,
    required this.customer,
    required this.countryCode,
  });

  dynamic email;
  dynamic phone;
  dynamic customer;
  dynamic countryCode;

  factory BuyerIdentity.fromRawJson(String str) => BuyerIdentity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BuyerIdentity.fromJson(Map<String, dynamic> json) => BuyerIdentity(
    email: json["email"],
    phone: json["phone"],
    customer: json["customer"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone": phone,
    "customer": customer,
    "countryCode": countryCode,
  };
}

class Cost {
  Cost({
    required this.totalAmount,
    required this.subtotalAmount,
    required this.totalTaxAmount,
    required this.totalDutyAmount,
  });

  TotalAmount totalAmount;
  TotalAmount subtotalAmount;
  dynamic totalTaxAmount;
  dynamic totalDutyAmount;

  factory Cost.fromRawJson(String str) => Cost.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cost.fromJson(Map<String, dynamic> json) => Cost(
    totalAmount: TotalAmount.fromJson(json["totalAmount"]),
    subtotalAmount: TotalAmount.fromJson(json["subtotalAmount"]),
    totalTaxAmount: json["totalTaxAmount"],
    totalDutyAmount: json["totalDutyAmount"],
  );

  Map<String, dynamic> toJson() => {
    "totalAmount": totalAmount.toJson(),
    "subtotalAmount": subtotalAmount.toJson(),
    "totalTaxAmount": totalTaxAmount,
    "totalDutyAmount": totalDutyAmount,
  };
}

class TotalAmount {
  TotalAmount({
    required this.amount,
    required this.currencyCode,
  });

  String amount;
  String currencyCode;

  factory TotalAmount.fromRawJson(String str) => TotalAmount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TotalAmount.fromJson(Map<String, dynamic> json) => TotalAmount(
    amount: json["amount"],
    currencyCode: json["currencyCode"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currencyCode": currencyCode,
  };
}

class Lines {
  Lines({
    required this.edges,
  });

  List<dynamic> edges;

  factory Lines.fromRawJson(String str) => Lines.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Lines.fromJson(Map<String, dynamic> json) => Lines(
    edges: List<dynamic>.from(json["edges"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "edges": List<dynamic>.from(edges.map((x) => x)),
  };
}

class UserError {
  UserError({
    required this.field,
    required this.message,
  });

  List<String> field;
  String message;

  factory UserError.fromRawJson(String str) => UserError.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserError.fromJson(Map<String, dynamic> json) => UserError(
    field: List<String>.from(json["field"].map((x) => x)),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "field": List<dynamic>.from(field.map((x) => x)),
    "message": message,
  };
}
