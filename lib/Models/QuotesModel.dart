// To parse this JSON data, do
//
//     final quotes = quotesFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'QuotesModel.g.dart';

List<Quotes> quotesFromJson(String str) =>
    List<Quotes>.from(json.decode(str).map((x) => Quotes.fromJson(x)));

String quotesToJson(List<Quotes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class Quotes {
  Quotes({
    this.text,
    this.author,
  });

  @HiveField(0)
  String text;
  @HiveField(1)
  String author;

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        text: json["text"],
        author: json["author"] == null ? null : json["author"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "author": author == null ? null : author,
      };
}
