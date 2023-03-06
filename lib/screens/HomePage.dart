import 'package:flutter/material.dart';
import 'package:v_netra/widgets/serviceCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const route = '/home-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
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
        ),
      ),
      appBar: AppBar(
        title: const Text('V-Netra'),
      ),
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.red),
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                ServiceCard('Face Recoginition', () {}),
                const SizedBox(
                  height: 10,
                ),
                ServiceCard('Image Capturing', () {}),
                const SizedBox(
                  height: 10,
                ),
                ServiceCard('Share Live Location', () {}),
                const SizedBox(
                  height: 10,
                ),
                ServiceCard('OCR', () {}),
                const SizedBox(
                  height: 10,
                ),
                ServiceCard('Reminder app', () {}),
              ],
            )),
      ),
    );
  }
}
