// To parse this JSON data, do
//
//     final stringToNestedObject = stringToNestedObjectFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

StringToNestedObject stringToNestedObjectFromJson(String str) =>
    StringToNestedObject.fromJson(json.decode(str));

String stringToNestedObjectToJson(StringToNestedObject data) =>
    json.encode(data.toJson());

@immutable
class StringToNestedObject {
  final String title;
  final String description;
  final Author author;
  const StringToNestedObject({
    required this.title,
    required this.description,
    required this.author,
  });

  factory StringToNestedObject.fromJson(Map<String, dynamic> json) =>
      StringToNestedObject(
        title: json["title"],
        description: json["description"],
        author: Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "author": author.toJson(),
      };
}

@immutable
class Author {
  final String name;
  final int age;
  const Author({
    required this.name,
    required this.age,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
      };
}
