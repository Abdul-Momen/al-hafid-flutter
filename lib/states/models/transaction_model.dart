// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Transactions {
  Transactions({
    required this.kind,
    required this.status,
    required this.amount,
    required this.gateway,
    this.id,
  });

  String kind;
  String status;
  String amount;
  String gateway;
  String? id;

  factory Transactions.fromRawJson(String str) => Transactions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
    kind: json["kind"],
    status: json["status"],
    amount: json["amount"],
    gateway: json["gateway"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "status": status,
    "amount": amount,
    "gateway": gateway,
    "id": id,
  };
}
