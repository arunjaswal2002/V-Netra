import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './screens/HomePage.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V-Netra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColor: Colors.lightBlue,
      ),
      home: SplashScreen(
          image: Image.asset(
            'assets/logo.jpg',
            alignment: Alignment.center,
          ),
          photoSize: 200.0,
          backgroundColor: Color(0xff141720),
          // styleTextUnderTheLoader: TextStyle(),
          loaderColor: Colors.white,
          seconds: 2,
          navigateAfterSeconds: HomePage(cameras)),
    );
  }
}
