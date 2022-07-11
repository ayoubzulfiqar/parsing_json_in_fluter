import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_examples/constant.dart';
import 'package:json_examples/models/complex_json_to_nested_object_model.dart';

class ComplexJSon extends StatelessWidget {
  const ComplexJSon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<ComplexJsonToNestedObject> getData() async {
      final response =
          await http.Client().get(Uri.parse(complexJsonToNestObjectURL));
      ComplexJsonToNestedObject complexJsonToNestedObject =
          complexJsonToNestedObjectFromJson(response.body);
      return complexJsonToNestedObject;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "ComplexJSonToNestedObject",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data as ComplexJsonToNestedObject;
              return ListView.builder(
                  itemCount: data.tags.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title: ${data.title}",
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Description: ${data.description}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Author Name: ${data.author.name}",
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Author Age: ${data.author.age.toString()}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Tag Name: ${data.tags[index].name}",
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Tag Quantity: ${data.tags[index].quantity.toString()}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  });
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
