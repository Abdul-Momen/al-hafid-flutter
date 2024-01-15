// To parse this JSON data, do
//
//     final onbordingResponse = onbordingResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class OnbordingResponse {
  OnbordingResponse({
    required this.asset,
  });

  Asset asset;

  factory OnbordingResponse.fromRawJson(String str) => OnbordingResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OnbordingResponse.fromJson(Map<String, dynamic> json) => OnbordingResponse(
    asset: Asset.fromJson(json["asset"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "asset": asset.toJson(),
  };
}

class Asset {
  Asset({
  //  required this.key,
    required this.publicUrl,
   // required this.attachment,
   // required this.createdAt,
   // required this.updatedAt,
   // required this.contentType,
   // required this.size,
  //  required this.checksum,
   // required this.themeId,
  });

 // String key;
  String publicUrl;
 // String attachment;
 // DateTime createdAt;
 // DateTime updatedAt;
 // String contentType;
 // int size;
 // String checksum;
 // int themeId;

  factory Asset.fromRawJson(String str) => Asset.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
   // key: json["key"]??'',
    publicUrl: json["public_url"]??'',
   // attachment: json["attachment"]??'',
   // createdAt: DateTime.parse(json["created_at"]??''),
   // updatedAt: DateTime.parse(json["updated_at"]??''),
    //contentType: json["content_type"]??'',
   // size: json["size"]??0,
   // checksum: json["checksum"]??'',
   // themeId: json["theme_id"]??0,
  );

  Map<String, dynamic> toJson() => {
    //"key": key,
    "public_url": publicUrl,
    //"attachment": attachment,
    //"created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
    // "content_type": contentType,
    // "size": size,
    // "checksum": checksum,
    // "theme_id": themeId,
  };
}
