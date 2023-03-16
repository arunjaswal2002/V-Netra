import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
            height: 80,
            padding: const EdgeInsets.only(left: 10, top: 20),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(58, 66, 86, 1.0),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text('V-Netra',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ));
  }
}
