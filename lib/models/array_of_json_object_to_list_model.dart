// To parse this JSON data, do
//
//     final arrayOfJsonToList = arrayOfJsonToListFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

ArrayOfJsonToList arrayOfJsonToListFromJson(String str) =>
    ArrayOfJsonToList.fromJson(json.decode(str));

String arrayOfJsonToListToJson(ArrayOfJsonToList data) =>
    json.encode(data.toJson());

@immutable
class ArrayOfJsonToList {
  final List<Tag> tags;
  const ArrayOfJsonToList({
    required this.tags,
  });

  factory ArrayOfJsonToList.fromJson(Map<String, dynamic> json) =>
      ArrayOfJsonToList(
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))).toList(),
      );

  Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
      };
}

@immutable
class Tag {
  final String name;
  final int quantity;
  const Tag({
    required this.name,
    required this.quantity,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
      };
}
