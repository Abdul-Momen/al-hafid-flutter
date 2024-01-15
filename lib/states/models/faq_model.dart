// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class FaqModel {
  FaqModel({
    required this.faq,
  });

  List<Faq> faq;

  factory FaqModel.fromRawJson(String str) => FaqModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    faq: List<Faq>.from(json["faq"].map((x) => Faq.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "faq": List<dynamic>.from(faq.map((x) => x.toJson())),
  };
}

class Faq {
  Faq({
    required this.title,
    required this.subtitle,
    required this.visible,
  });

  String title;
  String subtitle;
  bool visible;

  factory Faq.fromRawJson(String str) => Faq.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
    title: json["title"],
    subtitle: json["subtitle"],
    visible: json["visible"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "visible": visible,
  };
}
