import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  var text;
  Icon i;
  Function f;
  ServiceCard(this.i, this.text, this.f);
  // const ServiceCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: const EdgeInsets.only(right: 12.0),
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1.0, color: Colors.white24))),
                child: i,
              ),
              title: Text(
                text,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                onPressed: () {
                  f();
                },
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              )),
        ));
  }
}
