// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);
import 'dart:convert';

class ReviewModel {
  ReviewModel({
    required this.reviews,
  });

  List<Review> reviews;

  factory ReviewModel.fromRawJson(String str) => ReviewModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
  };
}

class Review {
  Review({
    required this.id,
    required this.rating,
    required this.title,
    required this.location,
    required this.body,
    required this.createdAt,
    required this.reply,
    required this.repliedAt,
    required this.author,
    required this.remoteId,
  });

  int id;
  int rating;
  String title;
  String location;
  String body;
  String createdAt;
  dynamic reply;
  dynamic repliedAt;
  String author;
  int remoteId;

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    rating: json["rating"],
    title: json["title"],
    location: json["location"],
    body: json["body"],
    createdAt: json["created_at"],
    reply: json["reply"]??'',
    repliedAt: json["replied_at"]??'',
    author: json["author"],
    remoteId: json["remote_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rating": rating,
    "title": title,
    "location": location,
    "body": body,
    "created_at": createdAt,
    "reply": reply,
    "replied_at": repliedAt,
    "author": author,
    "remote_id": remoteId,
  };
}
