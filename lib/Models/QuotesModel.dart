// To parse this JSON data, do
//
//     final quotes = quotesFromJson(jsonString);

import 'dart:convert';

List<Quotes> quotesFromJson(String str) => List<Quotes>.from(json.decode(str).map((x) => Quotes.fromJson(x)));

String quotesToJson(List<Quotes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quotes {
  Quotes({
    this.text,
    this.author,
  });

  String text;
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
