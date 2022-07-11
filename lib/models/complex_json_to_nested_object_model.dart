// To parse this JSON data, do
//
//     final complexJsonToNestedObject = complexJsonToNestedObjectFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

ComplexJsonToNestedObject complexJsonToNestedObjectFromJson(String str) =>
    ComplexJsonToNestedObject.fromJson(json.decode(str));

String complexJsonToNestedObjectToJson(ComplexJsonToNestedObject data) =>
    json.encode(data.toJson());

@immutable
class ComplexJsonToNestedObject {
  const ComplexJsonToNestedObject({
    required this.title,
    required this.description,
    required this.author,
    required this.tags,
  });

  final String title;
  final String description;
  final Author author;
  final List<Tag> tags;

  factory ComplexJsonToNestedObject.fromJson(Map<String, dynamic> json) =>
      ComplexJsonToNestedObject(
        title: json["title"],
        description: json["description"],
        author: Author.fromJson(json["author"]),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "author": author.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
      };
}

@immutable
class Author {
  const Author({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
      };
}

@immutable
class Tag {
  const Tag({
    required this.name,
    required this.quantity,
  });

  final String name;
  final int quantity;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
      };
}
