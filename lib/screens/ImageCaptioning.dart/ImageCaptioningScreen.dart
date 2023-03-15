import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImageCaptioning extends StatefulWidget {
  @override
  _ImageCaptioningState createState() => _ImageCaptioningState();
}

class _ImageCaptioningState extends State<ImageCaptioning> {
  var _caption = "";

  Future<void> _takePictureAndGenerateCaption() async {
    // Take picture using camera
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final base64Image = base64Encode(bytes);

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

      final data = jsonDecode(response.body)['data'];
      print(data);
      setState(() {
        _caption = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Captioning'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _caption.isEmpty
                ? Text('Take a picture to generate a caption.')
                : Text(_caption, textAlign: TextAlign.center),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Take Picture'),
              onPressed: _takePictureAndGenerateCaption,
            ),
          ],
        ),
      ),
    );
  }
}
