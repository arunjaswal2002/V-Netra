import 'package:flutter/material.dart';
import 'package:v_netra/widgets/serviceCard.dart';
import '../widgets/Mydrawer.dart';
import '../screens/OCR/OCRScreen.dart';

class HomePage extends StatelessWidget {
  // const Homepage({super.key});
  static const route = '/home-page';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text('V-Netra'),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: 1000,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  ServiceCard('Face Recoginition', () {},
                      Image.asset('assets/face_rec.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  ServiceCard('Image Captioning', () {},
                      Image.asset('assets/face_rec.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  ServiceCard('Share Live Location', () {},
                      Image.asset('assets/face_rec.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  ServiceCard('OCR', () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => OCRScreen()));
                  }, Image.asset('assets/face_rec.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  ServiceCard('Reminder app', () {},
                      Image.asset('assets/face_rec.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  ServiceCard('Entertainment  app', () {},
                      Image.asset('assets/face_rec.png')),
                ],
              )),
        ),
      ),
    );
  }
}
