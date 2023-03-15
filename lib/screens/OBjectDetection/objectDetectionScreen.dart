import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class ObjectDetectionScreen extends StatefulWidget {
  // const ObjectDetectionScreen({super.key});
  List<CameraDescription> cameras;
  ObjectDetectionScreen(this.cameras);

  @override
  State<ObjectDetectionScreen> createState() => _ObjectDetectionScreenState();
}

class _ObjectDetectionScreenState extends State<ObjectDetectionScreen> {
  var isWorking = false;
  var result = "";
  CameraController? cameraController;
  CameraImage? imgCamera;

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/mobilenet_v1_1.0_224.tflite',
        labels: 'assets/mobilenet_v1_1.0_224.txt');
  }

  @override
  void initCamera() {
    cameraController =
        CameraController(widget.cameras[0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController!.startImageStream((image) {
          if (!isWorking) {
            isWorking = true;
            imgCamera = image;
            runModelOnStreamFrame();
          }
        });
      });
    });
    super.initState();
  }

  runModelOnStreamFrame() async {
    if (imgCamera != null) {
      var recognitions = await Tflite.runModelOnFrame(
        bytesList: imgCamera!.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: imgCamera!.height,
        imageWidth: imgCamera!.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 4,
        threshold: 0.5,
        asynch: true,
      );
      result = "";
      recognitions!.forEach((response) {
        result += response['label'] +
            " " +
            (response['confidence'] as double).toStringAsFixed(2) +
            "\n\n";
      });
      setState(() {
        result;
      });
      isWorking = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    await Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Object detection")),
      body: Container(
        decoration: BoxDecoration(color: Colors.cyan),
        child: Column(
          children: [
            Stack(children: [
              Center(
                child: TextButton(
                  onPressed: initCamera,
                  child: Container(
                      margin: EdgeInsets.only(top: 35),
                      height: 400,
                      width: 300,
                      child: imgCamera == null
                          ? Container(
                              height: 200,
                              width: 350,
                              child: Icon(
                                Icons.photo_camera_front,
                                color: Colors.blueAccent,
                                size: 40,
                              ),
                            )
                          : AspectRatio(
                              aspectRatio: 4 / 3,
                              child: CameraPreview(cameraController!),
                            )),
                ),
              ),
            ]),
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 55.0),
                  child: SingleChildScrollView(
                    child: Text(
                      result,
                      style: const TextStyle(
                          backgroundColor: Colors.black,
                          fontSize: 30,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
