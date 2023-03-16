import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:v_netra/main.dart';
import '/screens/Entertainment/EntertainmentScreen.dart';
import '/screens/OBjectDetection/objectDetectionScreen.dart';
import './ImageCaptioning.dart/ImageCaptioningScreen.dart';
import '../widgets/Mydrawer.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';
import './OCR/OCRScreen.dart';
import './Location/LocationScreen.dart';

class HomePage extends StatefulWidget {
  List<CameraDescription> cameras;
  HomePage(this.cameras);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var text = "Hold the button and start recording";
  var isListening = false;
  SpeechToText speectToText = SpeechToText();
  final topAppBar = AppBar(
    elevation: 0.1,
    centerTitle: true,
    backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
    title: const Text(
      'V-netra',
      style: TextStyle(color: Colors.white),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 100,
        animate: isListening,
        glowColor: Colors.black,
        repeatPauseDuration: const Duration(microseconds: 1000),
        repeat: true,
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            var available = await speectToText.initialize();
            setState(() {
              if (!isListening) {
                if (available) {
                  setState(() {
                    isListening = true;
                    speectToText.listen(onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                        text = text.toLowerCase();
                      });
                    });
                  });
                }
              }
            });
          },
          onTapUp: (details) {
            setState(() {
              isListening = false;
            });
            speectToText.stop();
            if (text != "") {
              if (text.contains("ocr")) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => OCRScreen()));
              } else if (text.contains("location")) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LocationScreen()));
              } else if (text.contains("entertainment")) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EntertainmentScreen()));
              } else if (text.contains("image") ||
                  text.contains("captioning") ||
                  text.contains("image captioning")) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ImageCaptioning()));
              } else if (text.contains("object") ||
                  text.contains("detection") ||
                  text.contains("object detection")) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ObjectDetectionScreen(cameras)));
              } else if (text.contains("ocr hindi")) {
                //      Navigator.of(context).push(MaterialPageRoute(
                // builder: (context) =>));
              } 
            }
          },
          child: const CircleAvatar(
              backgroundColor: Colors.red,
              radius: 35,
              child: Icon(
                Icons.mic,
                color: Colors.white,
              )),
        ),
      ),
      backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      drawer: const MyDrawer(),
      appBar: topAppBar,
      body: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}

// Container(
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           children: [
//             ServiceCard(
//                 const Icon(
//                   Icons.face_outlined,
//                   color: Colors.white,
//                 ),
//                 'Face Recognition',
//                 () {}),
//             ServiceCard(
//                 Icon(Icons.image_outlined),
//                 'Image Captioning',
//                 () => Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => ImageCaptioning()))),
//             ServiceCard(
//                 Icon(Icons.image_outlined),
//                 'OCR',
//                 () => Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => OCRScreen()))),
//             ServiceCard(
//                 Icon(Icons.image_outlined),
//                 'Location Sharing',
//                 () => Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => LocationScreen()))),
//             ServiceCard(Icon(Icons.image_outlined), 'Entertainment', () {}),
//             ServiceCard(Icon(Icons.image_outlined), 'Reminder', () {}),
//             ServiceCard(

//                 Icon(Icons.image_outlined),
//                 'Object Detection',
//                 () => Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => ObjectDetectionScreen(cameras)))),
//           ],
//         ),
//       ),
