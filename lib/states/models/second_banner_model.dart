// To parse this JSON data, do
//
//     final secondBannerModel = secondBannerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SecondBannerModel {
  SecondBannerModel({
    required this.the1531902587175,
  });

  String the1531902587175;

  factory SecondBannerModel.fromRawJson(String str) => SecondBannerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SecondBannerModel.fromJson(Map<String, dynamic> json) => SecondBannerModel(
    the1531902587175: json["1531902587175"]??'',
  );

  Map<String, dynamic> toJson() => {
    "1531902587175": the1531902587175,
  };
}
