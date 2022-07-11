import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_examples/constant.dart';
import 'package:json_examples/models/array_of_json_object_to_list_model.dart';

class ArrayOfJsonObjectToList extends StatelessWidget {
  const ArrayOfJsonObjectToList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<ArrayOfJsonToList> getData() async {
      final response =
          await http.Client().get(Uri.parse(arrayOfJsonObjectToListURL));
      ArrayOfJsonToList arrayOfJsonToList =
          arrayOfJsonToListFromJson(response.body);

      return arrayOfJsonToList;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "ArrayOfJsonObjectToList",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as ArrayOfJsonToList;
            return ListView.builder(
              itemCount: data.tags.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    data.tags[index].name,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    data.tags[index].quantity.toString(),
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
