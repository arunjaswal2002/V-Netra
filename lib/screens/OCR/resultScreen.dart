import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String text;

  const ResultScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          padding: const EdgeInsets.all(30.0),
          width: double.infinity,
          child: Text(text),
        ),
      );
}
