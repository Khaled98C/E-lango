import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';

class Testeng extends StatelessWidget {
  const Testeng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List data = [
      {
        'id': 1,
        "name": "khaled",
        'a': [
          {"home": "saida", "gpa": "1"}
        ]
      },
      {
        'id': 2,
        "name": "saed",
        'a': [
          {"home": "saida", "gpa": "3"}
        ]
      },
      {
        'id': 3,
        "name": "ad",
        'a': [
          {"home": "saida", "gpa": "5"}
        ]
      },
        {
        'id': 3,
        "name": "ad",
        'a': [
          {"home": "saida", "gpa": "5"}
        ]
      },  {
        'id': 3,
        "name": "ad",
        'a': [
          {"home": "saida", "gpa": "05"}
        ]
      },  {
        'id': 3,
        "name": "ad",
        'a': [
          {"home": "saida", "gpa": "57"}
        ]
      },  {
        'id': 3,
        "name": "ad",
        'a': [
          {"home": "saida", "gpa": "52"}
        ]
      },  {
        'id': 3,
        "name": "ad",
        'a': [
          {"home": "saida", "gpa": "55"}
        ]
      },
    ];
     return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) => Column(
                    children: [
                      ListTile(
                        leading: Text(
                          data[index]["id"].toString(),
                        ),
                        trailing: Text(
                          data[index]["name"],
                        ),
                        title: Expanded(
                          child: Text(data[index]['a'][0]['gpa']),
                        ),
                      ),
                      //  Divider(),
                    ],
                  ))),
        ));
  }
}
