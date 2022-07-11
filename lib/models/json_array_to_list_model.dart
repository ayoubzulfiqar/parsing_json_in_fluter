// Not working



// // To parse this JSON data, do
// //
// //     final arrayToList = arrayToListFromJson(jsonString);

// import 'dart:convert';

// import 'package:flutter/foundation.dart' show immutable;

// ArrayToListModel arrayToListFromJson(String str) =>
//     ArrayToListModel.fromJson(json.decode(str));

// String arrayToListToJson(ArrayToListModel data) => json.encode(data.toJson());

// @immutable
// class ArrayToListModel {
//   const ArrayToListModel({
//     required this.tags,
//   });

//   final List<String> tags;

//   factory ArrayToListModel.fromJson(Map<String, dynamic> json) =>
//       ArrayToListModel(
//         tags: List<String>.from(json["tags"].map((x) => x)).toList(),
//       );

//   Map<String, dynamic> toJson() => {
//         "tags": List<dynamic>.from(tags.map((x) => x)),
//       };
// }
