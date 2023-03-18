import 'package:flutter/material.dart';
import 'package:v_netra/screens/Entertainment/EnterScreen.dart';
// import 'package:v_netra/screens/Entertainment/EnterScreen.dart';
import 'package:v_netra/screens/Entertainment/EntertainmentScreen.dart';
import 'package:v_netra/screens/HomePage.dart';
import 'package:v_netra/screens/ImageCaptioning.dart/ImageCaptioningScreen.dart';
import 'package:v_netra/screens/OBjectDetection/objectDetectionScreen.dart';
import "../screens/OCR/OCRScreen.dart";
import '../screens/Location/LocationScreen.dart';
import 'package:camera/camera.dart';
import 'package:vibration/vibration.dart';
// import '../screens/OCRforHindi/OCRForHIndi.dart';

class MyDrawer extends StatelessWidget {
  List<CameraDescription> cameras;
  MyDrawer(this.cameras);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: SafeArea(
        child: Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: SizedBox(
            width: 260,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Divider(
                  height: 20,
                ),
                Image.asset(
                  'assets/0000.png',
                  width: 200,
                ),
                const Divider(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text(
                      'Home',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Vibration.vibrate(duration: 500);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePage(cameras)));
                    },
                  ),
                ),
                Divider(),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: ListTile(
                    leading: Icon(Icons.document_scanner),
                    title: const Text(
                      'OCR',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Vibration.vibrate(duration: 500);

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => OCRScreen()));
                    },
                  ),
                ),
                Divider(),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: ListTile(
                    leading: const Icon(Icons.gps_fixed),
                    title: const Text(
                      'Get my location',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Vibration.vibrate(duration: 500);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LocationScreen()));
                    },
                  ),
                ),
                Divider(),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text(
                      'Image Captioning',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Vibration.vibrate(duration: 500);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ImageCaptioning()));
                    },
                  ),
                ),
                Divider(),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: ListTile(
                    leading: const Icon(Icons.music_note),
                    title: const Text(
                      'Entertainment App',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Vibration.vibrate(duration: 500);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EnterScreen()));
                    },
                  ),
                ),
                Divider(),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: ListTile(
                    leading: Icon(Icons.data_object),
                    title: const Text(
                      'Object Detection',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      Vibration.vibrate(duration: 500);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ObjectDetectionScreen(cameras)));
                    },
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
