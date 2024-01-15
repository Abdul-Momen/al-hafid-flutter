// To parse this JSON data, do
//
//     final anotherCartModel = anotherCartModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AnotherCartModel {
  AnotherCartModel({
    required this.cartLinesAdd,
  });

  CartLinesAdd cartLinesAdd;

  factory AnotherCartModel.fromRawJson(String str) => AnotherCartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnotherCartModel.fromJson(Map<String, dynamic> json) => AnotherCartModel(
    cartLinesAdd: CartLinesAdd.fromJson(json["cartLinesAdd"]),
  );

  Map<String, dynamic> toJson() => {
    "cartLinesAdd": cartLinesAdd.toJson(),
  };
}

class CartLinesAdd {
  CartLinesAdd({
    required this.cart,
    required this.userErrors,
  });

  Cart cart;
  List<UserError> userErrors;

  factory CartLinesAdd.fromRawJson(String str) => CartLinesAdd.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartLinesAdd.fromJson(Map<String, dynamic> json) => CartLinesAdd(
    cart: Cart.fromJson(json["cart"]??[]),
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

  List<Edge> edges;

  factory Lines.fromRawJson(String str) => Lines.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Lines.fromJson(Map<String, dynamic> json) => Lines(
    edges: List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class Edge {
  Edge({
    required this.node,
  });

  Node node;

  factory Edge.fromRawJson(String str) => Edge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
    node: Node.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class Node {
  Node({
    required this.id,
    required this.merchandise,
  });

  String id;
  Merchandise merchandise;

  factory Node.fromRawJson(String str) => Node.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    id: json["id"],
    merchandise: Merchandise.fromJson(json["merchandise"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "merchandise": merchandise.toJson(),
  };
}

class Merchandise {
  Merchandise({
    required this.id,
  });

  String id;

  factory Merchandise.fromRawJson(String str) => Merchandise.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Merchandise.fromJson(Map<String, dynamic> json) => Merchandise(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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

