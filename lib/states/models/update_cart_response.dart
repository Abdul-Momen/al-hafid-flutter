// To parse this JSON data, do
//
//     final updateCartResponse = updateCartResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UpdateCartResponse {
  UpdateCartResponse({
    required this.cartLinesUpdate,
  });

  CartLinesUpdate cartLinesUpdate;

  factory UpdateCartResponse.fromRawJson(String str) => UpdateCartResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateCartResponse.fromJson(Map<String, dynamic> json) => UpdateCartResponse(
    cartLinesUpdate: CartLinesUpdate.fromJson(json["cartLinesUpdate"]),
  );

  Map<String, dynamic> toJson() => {
    "cartLinesUpdate": cartLinesUpdate.toJson(),
  };
}

class CartLinesUpdate {
  CartLinesUpdate({
    required this.cart,
    required this.userErrors,
  });

  Cart cart;
  List<UserError> userErrors;

  factory CartLinesUpdate.fromRawJson(String str) => CartLinesUpdate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartLinesUpdate.fromJson(Map<String, dynamic> json) => CartLinesUpdate(
    cart: Cart.fromJson(json["cart"]),
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
    required this.lines,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  Lines lines;

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    lines: Lines.fromJson(json["lines"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "lines": lines.toJson(),
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
