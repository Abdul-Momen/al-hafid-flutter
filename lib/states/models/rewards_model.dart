// To parse this JSON data, do
//
//     final reqardsPointModel = reqardsPointModelFromJson(jsonString);

import 'dart:convert';

class ReqardsPointModel {
  int availablePoints;
  int pendingPoints;
  List<Reward> rewards;

  ReqardsPointModel({
    required this.availablePoints,
    required this.pendingPoints,
    required this.rewards,
  });

  factory ReqardsPointModel.fromRawJson(String str) => ReqardsPointModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReqardsPointModel.fromJson(Map<String, dynamic> json) => ReqardsPointModel(
    availablePoints: json["availablePoints"]??0,
    pendingPoints: json["pendingPoints"]??0,
    rewards: List<Reward>.from(json["rewards"].map((x) => Reward.fromJson(x))??[]),
  );

  Map<String, dynamic> toJson() => {
    "availablePoints": availablePoints,
    "pendingPoints": pendingPoints,
    "rewards": List<dynamic>.from(rewards.map((x) => x.toJson())),
  };
}

class Reward {
  int id;
  String shop;
  int customerId;
  String description;
  int pointTransactionId;
  int pointRedeemRuleId;
  String discountCode;
  dynamic usedAt;
  dynamic orderId;
  dynamic orderName;
  String status;
  String createAt;

  Reward({
    required this.id,
    required this.shop,
    required this.customerId,
    required this.description,
    required this.pointTransactionId,
    required this.pointRedeemRuleId,
    required this.discountCode,
    this.usedAt,
    this.orderId,
    this.orderName,
    required this.status,
    required this.createAt,
  });

  factory Reward.fromRawJson(String str) => Reward.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
    id: json["id"]??0,
    shop: json["shop"]??"",
    customerId: json["customerId"]??0,
    description: json["description"]??'',
    pointTransactionId: json["pointTransactionId"]??0,
    pointRedeemRuleId: json["pointRedeemRuleId"]??0,
    discountCode: json["discountCode"]??'',
    usedAt: json["usedAt"],
    orderId: json["orderId"],
    orderName: json["orderName"],
    status: json["status"]??'',
    createAt: json["createAt"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop": shop,
    "customerId": customerId,
    "description": description,
    "pointTransactionId": pointTransactionId,
    "pointRedeemRuleId": pointRedeemRuleId,
    "discountCode": discountCode,
    "usedAt": usedAt,
    "orderId": orderId,
    "orderName": orderName,
    "status": status,
    "createAt": createAt,
  };
}
