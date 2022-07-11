// To parse this JSON data, do
//
//     final stringToJson = stringToJsonFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

StringToJson stringToJsonFromJson(String str) =>
    StringToJson.fromJson(json.decode(str));

String stringToJsonToJson(StringToJson data) => json.encode(data.toJson());

@immutable
class StringToJson {
  final String name;
  final int age;
  const StringToJson({
    required this.name,
    required this.age,
  });

  factory StringToJson.fromJson(Map<String, dynamic> json) => StringToJson(
        name: json["name"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
      };
}
