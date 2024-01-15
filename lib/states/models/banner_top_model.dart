// To parse this JSON data, do
//
//     final bannerTop = bannerTopFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class BannerTop {
  BannerTop({
    required this.the1554699267962,
  });

  String the1554699267962;

  factory BannerTop.fromRawJson(String str) => BannerTop.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerTop.fromJson(Map<String, dynamic> json) => BannerTop(
    the1554699267962: json["1554699267962"],
  );

  Map<String, dynamic> toJson() => {
    "1554699267962": the1554699267962,
  };
}
