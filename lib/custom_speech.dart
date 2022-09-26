import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  final flutterTts = FlutterTts();
  final _controller = TextEditingController();
  bool isAvailable = false;
  double speechSpeed = 0.5;
  Color sliderColor = Colors.green;

  void speak() async {
    try {
      await flutterTts.setLanguage('en-US');
      if (Platform.isAndroid) {
        await flutterTts.isLanguageInstalled('en-US').then((value) {
          print('Language is Available:- $value');
          isAvailable = value;
        });
      }
      await flutterTts.setSpeechRate(speechSpeed);
      await flutterTts.setPitch(1);
      if (isAvailable) {
        if (_controller.text.isNotEmpty) {
          await flutterTts.speak(_controller.text);
        } else {
          await flutterTts.speak('No Text Found');
        }
      }
    } catch (e) {
      print('error at the time of executing');
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
      appBar: AppBar(title: const Text("Custom text to speech")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(hintText: 'Enter Text'),
                )),
            const Text('Speech Speed'),
            Slider(
                value: speechSpeed,
                activeColor: sliderColor,
                min: 0.1,
                max: 1,
                divisions: 9,
                label: ((speechSpeed*10).round()/10).toString(),
                onChanged: (double value) =>
                    setState(() {
                      if(value <=0.2 || value > 0.8) {
                        sliderColor = Colors.red;
                      }
                      if(value == 0.3 || value == 0.8) {
                        sliderColor = Colors.yellow;
                      }
                      if(value > 0.3 && value <= 0.7) {
                        sliderColor = Colors.green;
                      }
                      speechSpeed = value;
                    })),
            MaterialButton(
                onPressed: () => speak(),
                child: const Text("Start Custom Speech")),
            MaterialButton(
                onPressed: () async => await flutterTts.stop(),
                child: const Text("Stop Speech"))
          ]),
        ),
      ),
    );
  }
}
