import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FlutterTts flutterTts = FlutterTts();
  bool isAvailable = false;

  void speak() async {
    try {
      await flutterTts.setLanguage('en-US');
      if (Platform.isAndroid) {
        await flutterTts.isLanguageInstalled('en-US').then((value) {
          print('Language is Available:- $value');
          isAvailable = value;
        });
      }
      await flutterTts.setPitch(1);
      if (isAvailable) {
        await flutterTts.speak('Default given text');
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
      appBar: AppBar(
        title: const Text("Default text to speech"),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/custom'),
              icon: const Icon(Icons.spatial_audio_off_outlined))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: MaterialButton(
              onPressed: () => speak(),
              child: const Text("Start Default Speech")),
        ),
      ),
    );
  }
}
