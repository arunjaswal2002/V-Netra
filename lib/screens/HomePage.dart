import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:v_netra/main.dart';
// import 'package:v_netra/screens/Entertainment/EnterScreen.dart';
import 'package:v_netra/screens/Entertainment/EntertainmentScreen.dart';
import 'package:v_netra/widgets/colors.dart';
// import '/screens/Entertainment/EntertainmentScreen.dart';
import '/screens/OBjectDetection/objectDetectionScreen.dart';
import './ImageCaptioning.dart/ImageCaptioningScreen.dart';
import '../widgets/Mydrawer.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:speech_to_text/speech_to_text.dart';
import './OCR/OCRScreen.dart';
import './Location/LocationScreen.dart';
import 'package:vibration/vibration.dart';
import 'package:splashscreen/splashscreen.dart';

class HomePage extends StatefulWidget {
  List<CameraDescription> cameras;
  HomePage(this.cameras);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  var text = "Hold the button and Start recording";
  var isListening = false;
  SpeechToText speectToText = SpeechToText();

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
                Vibration.vibrate(duration: 500);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => OCRScreen()));
              } else if (text.contains("location")) {
                Vibration.vibrate(duration: 500);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LocationScreen()));
              } else if (text.contains("entertainment")) {
                Vibration.vibrate(duration: 500);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EnterTainmentScreen()));
              } else if (text.contains("image") ||
                  text.contains("captioning") ||
                  text.contains("image captioning")) {
                Vibration.vibrate(duration: 500);

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ImageCaptioning()));
              } else if (text.contains("object") ||
                  text.contains("detection") ||
                  text.contains("object detection")) {
                Vibration.vibrate(duration: 500);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ObjectDetectionScreen(cameras)));
              } else if (text.contains("ocr hindi")) {
                Vibration.vibrate(duration: 500);

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
      backgroundColor: AppColor.homePageBackground,
      drawer: MyDrawer(cameras),
      appBar: AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'V-Netra',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(color: AppColor.homePageTitle, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
