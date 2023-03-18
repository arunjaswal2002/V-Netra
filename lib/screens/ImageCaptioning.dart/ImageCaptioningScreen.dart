import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:v_netra/main.dart';
import 'package:v_netra/widgets/Mydrawer.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ImageCaptioning extends StatefulWidget {
  @override
  _ImageCaptioningState createState() => _ImageCaptioningState();
}

class _ImageCaptioningState extends State<ImageCaptioning> {
  var flutterTts = FlutterTts();
  var _caption = "Take a picture to generate captions";
  var isLoading = false;
  Future<void> _takePictureAndGenerateCaption() async {
    // Take picture using camera
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      setState(() {
        isLoading = true;
      });
      final response = await http.post(
        Uri.parse(
            'https://rajgupta1-nlpconnect-vit-gpt2-image-captio-f636dd2.hf.space/run/predict'),
        body: jsonEncode({
          "data": ["data:image/png;base64,$base64Image"],
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      void _startSpeaking(String text) async {
        await Future.delayed(const Duration(milliseconds: 2000), () {
          var result = flutterTts.speak(text);
          if (result == 1) print('Speaking');
        });
      }

      final data = jsonDecode(response.body)['data'].toString();
      setState(() {
        isLoading = false;
        _caption = data;
        _startSpeaking(_caption);
      });
      print(data);
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Captioning'),
      ),
      drawer: MyDrawer(cameras),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isLoading ? CircularProgressIndicator() : Text(_caption),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _takePictureAndGenerateCaption,
              child: const Text('Take Picture'),
            ),
            TextButton(
                onPressed: () async {
                  var result = await flutterTts.stop();

                  if (result == 1) {
                    print('Stopped speaking');
                  } else {
                    //not speaking
                    print('Still speaking');
                  }
                },
                child: const Text(
                  'Stop Speaking',
                ))
          ],
        ),
      ),
    );
  }
}
