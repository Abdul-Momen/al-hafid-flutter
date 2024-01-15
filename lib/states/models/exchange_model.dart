// To parse this JSON data, do
//
//     final exchangeModel = exchangeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ExchangeModel {
  ExchangeModel({
    required this.asset,
  });

  Asset asset;

  factory ExchangeModel.fromRawJson(String str) => ExchangeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExchangeModel.fromJson(Map<String, dynamic> json) => ExchangeModel(
    asset: Asset.fromJson(json["asset"]),
  );

  Map<String, dynamic> toJson() => {
    "asset": asset.toJson(),
  };
}

class Asset {
  Asset({
    required this.key,
    required this.publicUrl,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
    required this.contentType,
    required this.size,
    required this.checksum,
    required this.themeId,
  });

  String key;
  dynamic publicUrl;
  String value;
  DateTime createdAt;
  DateTime updatedAt;
  String contentType;
  int size;
  String checksum;
  int themeId;

  factory Asset.fromRawJson(String str) => Asset.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
    key: json["key"],
    publicUrl: json["public_url"],
    value: json["value"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    contentType: json["content_type"],
    size: json["size"],
    checksum: json["checksum"],
    themeId: json["theme_id"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "public_url": publicUrl,
    "value": value,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "content_type": contentType,
    "size": size,
    "checksum": checksum,
    "theme_id": themeId,
  };
}
