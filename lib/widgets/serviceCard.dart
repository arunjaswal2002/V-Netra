import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  // const ServiceCard({super.key});
  final String title;
  final Function onpressed;
  ServiceCard(this.title, this.onpressed);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Card(
          elevation: 10,
          color: Colors.orangeAccent,
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Text(title),
                  TextButton(onPressed: () => onpressed, child: const Text('Press'))
                ],
              ))),
    );
  }
}
