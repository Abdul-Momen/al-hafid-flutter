// To parse this JSON data, do
//
//     final createCartModel = createCartModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// To parse this JSON data, do
//
//     final createCartModel = createCartModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class CreateCartModel {
  CreateCartModel({
    required this.cartCreate,
  });

  CartCreate cartCreate;

  factory CreateCartModel.fromRawJson(String str) => CreateCartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateCartModel.fromJson(Map<String, dynamic> json) => CreateCartModel(
    cartCreate: CartCreate.fromJson(json["cartCreate"]),
  );

  Map<String, dynamic> toJson() => {
    "cartCreate": cartCreate.toJson(),
  };
}

class CartCreate {
  CartCreate({
    required this.cart,
  });

  Cart cart;

  factory CartCreate.fromRawJson(String str) => CartCreate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartCreate.fromJson(Map<String, dynamic> json) => CartCreate(
    cart: Cart.fromJson(json["cart"]),
  );

  Map<String, dynamic> toJson() => {
    "cart": cart.toJson(),
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
  String createdAt;
  String updatedAt;
  Lines lines;

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"]??'',
    createdAt: json["createdAt"]??'',
    updatedAt: json["updatedAt"]??'',
    lines: Lines.fromJson(json["lines"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
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
    edges: List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))??[]),
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
    node: Node.fromJson(json["node"]??{}),
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
    id: json["id"]??'',
    merchandise: Merchandise.fromJson(json["merchandise"]??''),
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



