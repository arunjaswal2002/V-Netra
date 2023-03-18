import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ResultScreen extends StatefulWidget {
  final String text;

  ResultScreen({super.key, required this.text});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  FlutterTts flutterTts = FlutterTts();
  @override
  void dispose() {
    // TODO: implement dispose
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Output : '),
        ),
        body: Column(
          children: [
            Container(
              height: 600,
              margin: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              padding: const EdgeInsets.all(30.0),
              width: double.infinity,
              child: SingleChildScrollView(child: Text(widget.text)),
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
                child: const Text('Stop Speaking'))
          ],
        ),
      );
}
