// in this example the model is not working

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_examples/constant.dart';

class ArrayToList extends StatelessWidget {
  const ArrayToList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<ArrayToListModel> getData() async {
    //   final response = await http.Client().get(Uri.parse(arrayToListURL));

    //   ArrayToListModel arrayToList = arrayToListFromJson(response.body);
    //   return arrayToList;
    // }

    Future<List<String>?> _getData() async {
      final response = await http.Client().get(Uri.parse(arrayToListURL));
      final parsed = jsonDecode(response.body)['tags'];
      List<String>? names = parsed != null ? List.from(parsed) : null;

      return names;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "ArrayToList",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: _getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data as List<String>;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        data[index],
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
