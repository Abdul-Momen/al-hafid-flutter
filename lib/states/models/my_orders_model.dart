// To parse this JSON data, do
//
//     final myOrdersModel = myOrdersModelFromJson(jsonString);

import 'package:alhafidh/states/models/order_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class MyOrdersModel {
  MyOrdersModel({
    required this.orders,
  });

  List<Order> orders;

  factory MyOrdersModel.fromRawJson(String str) => MyOrdersModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyOrdersModel.fromJson(Map<String, dynamic> json) => MyOrdersModel(
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

