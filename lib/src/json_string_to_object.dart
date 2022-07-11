import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_examples/constant.dart';
import 'package:json_examples/models/string_to_json_object_model.dart';

class JsonStringToObject extends StatelessWidget {
  const JsonStringToObject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<StringToJson> getData() async {
      final response = await http.Client().get(Uri.parse(stringToJsonURL));
      StringToJson stringToJson =
          StringToJson.fromJson(jsonDecode(response.body));
      // print("Data: ${stringToJson.name} ${stringToJson.age}");
      return stringToJson;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "JsonStringToObject",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data as StringToJson;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.name.toString(),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data.age.toString(),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
