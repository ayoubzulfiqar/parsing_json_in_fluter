import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_examples/constant.dart';
import 'package:json_examples/models/string_to_json_nested_object_model.dart';

class StringToNestedJsonObject extends StatelessWidget {
  const StringToNestedJsonObject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<StringToNestedObject> getData() async {
      final response =
          await http.Client().get(Uri.parse(stringToNestedObjectURL));
      StringToNestedObject stringToNestedObject =
          stringToNestedObjectFromJson(response.body);
      return stringToNestedObject;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "StringToNestedJsonObject",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data as StringToNestedObject;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title: ${data.title}",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Description: ${data.description}",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "AuthorName: ${data.author.name}",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "AuthorAge: ${data.author.age}",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
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
