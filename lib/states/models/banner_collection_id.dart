// To parse this JSON data, do
//
//     final bannnerCollectionId = bannnerCollectionIdFromJson(jsonString);

import 'dart:convert';

class BannerCollectionId {
  CollectionByHandle collectionByHandle;

  BannerCollectionId({
    required this.collectionByHandle,
  });

  factory BannerCollectionId.fromRawJson(String str) => BannerCollectionId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerCollectionId.fromJson(Map<String, dynamic> json) => BannerCollectionId(
    collectionByHandle: CollectionByHandle.fromJson(json["collectionByHandle"]??{}),
  );

  Map<String, dynamic> toJson() => {
    "collectionByHandle": collectionByHandle.toJson(),
  };
}

class CollectionByHandle {
  String id;

  CollectionByHandle({
    required this.id,
  });

  factory CollectionByHandle.fromRawJson(String str) => CollectionByHandle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CollectionByHandle.fromJson(Map<String, dynamic> json) => CollectionByHandle(
    id: json["id"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
