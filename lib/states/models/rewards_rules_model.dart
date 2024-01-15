// To parse this JSON data, do
//
//     final rewardsRulesModel = rewardsRulesModelFromJson(jsonString);

import 'dart:convert';

List<RewardsRulesModel> rewardsRulesModelFromJson(String str) => List<RewardsRulesModel>.from(json.decode(str).map((x) => RewardsRulesModel.fromJson(x)));

String rewardsRulesModelToJson(List<RewardsRulesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RewardsRulesModel {
  int id;
  String shop;
  String name;
  String type;
  dynamic referralType;
  String status;
  int redeemPoints;
  String discountType;
  double discount;
  double minimumPurchaseAmount;
  DateTime createAt;
  DateTime updateAt;
  double maximumShippingRate;
  dynamic productId;
  dynamic variantId;
  dynamic productData;
  dynamic collectionId;
  dynamic collectionData;
  String customerFacingLabel;
  dynamic restrictCustomers;
  dynamic restrictCustomersWithTags;
  String rewardInterval;
  String appliesOn;
  bool combinedWithProductDiscount;
  bool combinedWithShippingDiscount;
  bool combinedWithOrderDiscount;
  dynamic triggeredCount;
  dynamic pointsCost;
  bool enableInterval;
  int redeemLimit;
  bool enableNumberOfUsagesLimit;
  int numberOfUsagesLimit;
  dynamic allowedCustomerTags;
  dynamic earnRuleId;
  dynamic vipTierId;
  dynamic redeemLabel;

  RewardsRulesModel({
    required this.id,
    required this.shop,
    required this.name,
    required this.type,
    this.referralType,
    required this.status,
    required this.redeemPoints,
    required this.discountType,
    required this.discount,
    required this.minimumPurchaseAmount,
    required this.createAt,
    required this.updateAt,
    required this.maximumShippingRate,
    this.productId,
    this.variantId,
    this.productData,
    this.collectionId,
    this.collectionData,
    required this.customerFacingLabel,
    this.restrictCustomers,
    this.restrictCustomersWithTags,
    required this.rewardInterval,
    required this.appliesOn,
    required this.combinedWithProductDiscount,
    required this.combinedWithShippingDiscount,
    required this.combinedWithOrderDiscount,
    this.triggeredCount,
    this.pointsCost,
    required this.enableInterval,
    required this.redeemLimit,
    required this.enableNumberOfUsagesLimit,
    required this.numberOfUsagesLimit,
    this.allowedCustomerTags,
    this.earnRuleId,
    this.vipTierId,
    this.redeemLabel,
  });

  factory RewardsRulesModel.fromJson(Map<String, dynamic> json) => RewardsRulesModel(
    id: json["id"],
    shop: json["shop"],
    name: json["name"],
    type: json["type"],
    referralType: json["referralType"],
    status: json["status"],
    redeemPoints: json["redeemPoints"],
    discountType: json["discountType"],
    discount: json["discount"],
    minimumPurchaseAmount: json["minimumPurchaseAmount"],
    createAt: DateTime.parse(json["createAt"]),
    updateAt: DateTime.parse(json["updateAt"]),
    maximumShippingRate: json["maximumShippingRate"],
    productId: json["productId"],
    variantId: json["variantId"],
    productData: json["productData"],
    collectionId: json["collectionId"],
    collectionData: json["collectionData"],
    customerFacingLabel: json["customerFacingLabel"],
    restrictCustomers: json["restrictCustomers"],
    restrictCustomersWithTags: json["restrictCustomersWithTags"],
    rewardInterval: json["rewardInterval"],
    appliesOn: json["appliesOn"],
    combinedWithProductDiscount: json["combinedWithProductDiscount"],
    combinedWithShippingDiscount: json["combinedWithShippingDiscount"],
    combinedWithOrderDiscount: json["combinedWithOrderDiscount"],
    triggeredCount: json["triggeredCount"],
    pointsCost: json["pointsCost"],
    enableInterval: json["enableInterval"],
    redeemLimit: json["redeemLimit"],
    enableNumberOfUsagesLimit: json["enableNumberOfUsagesLimit"],
    numberOfUsagesLimit: json["numberOfUsagesLimit"],
    allowedCustomerTags: json["allowedCustomerTags"],
    earnRuleId: json["earnRuleId"],
    vipTierId: json["vipTierId"],
    redeemLabel: json["redeemLabel"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop": shop,
    "name": name,
    "type": type,
    "referralType": referralType,
    "status": status,
    "redeemPoints": redeemPoints,
    "discountType": discountType,
    "discount": discount,
    "minimumPurchaseAmount": minimumPurchaseAmount,
    "createAt": createAt.toIso8601String(),
    "updateAt": updateAt.toIso8601String(),
    "maximumShippingRate": maximumShippingRate,
    "productId": productId,
    "variantId": variantId,
    "productData": productData,
    "collectionId": collectionId,
    "collectionData": collectionData,
    "customerFacingLabel": customerFacingLabel,
    "restrictCustomers": restrictCustomers,
    "restrictCustomersWithTags": restrictCustomersWithTags,
    "rewardInterval": rewardInterval,
    "appliesOn": appliesOn,
    "combinedWithProductDiscount": combinedWithProductDiscount,
    "combinedWithShippingDiscount": combinedWithShippingDiscount,
    "combinedWithOrderDiscount": combinedWithOrderDiscount,
    "triggeredCount": triggeredCount,
    "pointsCost": pointsCost,
    "enableInterval": enableInterval,
    "redeemLimit": redeemLimit,
    "enableNumberOfUsagesLimit": enableNumberOfUsagesLimit,
    "numberOfUsagesLimit": numberOfUsagesLimit,
    "allowedCustomerTags": allowedCustomerTags,
    "earnRuleId": earnRuleId,
    "vipTierId": vipTierId,
    "redeemLabel": redeemLabel,
  };


}
