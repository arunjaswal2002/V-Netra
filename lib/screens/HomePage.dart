import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '/screens/OBjectDetection/objectDetectionScreen.dart';
import './ImageCaptioning.dart/ImageCaptioningScreen.dart';
import '/widgets/serviceCard.dart';
import '../widgets/Mydrawer.dart';
import './OCR/OCRScreen.dart';
import './Location/LocationScreen.dart';

class HomePage extends StatelessWidget {
  // const Homepage({super.key});
  List<CameraDescription> cameras;
  HomePage(this.cameras);
  static const route = '/home-page';
  final makeBottom = Container(
    height: 55.0,
    child: BottomAppBar(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.blur_on, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.hotel, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_box, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
    title: const Text(
      'V-netra',
      style: TextStyle(color: Colors.white),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      drawer: MyDrawer(),
      appBar: topAppBar,
      bottomNavigationBar: makeBottom,
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            ServiceCard(
                const Icon(
                  Icons.face_outlined,
                  color: Colors.white,
                ),
                'Face Recognition',
                () {}),
            ServiceCard(
                Icon(Icons.image_outlined),
                'Image Captioning',
                () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ImageCaptioning()))),
            ServiceCard(
                Icon(Icons.image_outlined),
                'OCR',
                () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OCRScreen()))),
            ServiceCard(
                Icon(Icons.image_outlined),
                'Location Sharing',
                () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LocationScreen()))),
            ServiceCard(Icon(Icons.image_outlined), 'Entertainment', () {}),
            ServiceCard(Icon(Icons.image_outlined), 'Reminder', () {}),
            ServiceCard(
                Icon(Icons.image_outlined),
                'Object Detection',
                () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ObjectDetectionScreen(cameras)))),
          ],
        ),
      ),
    );
  }
}
