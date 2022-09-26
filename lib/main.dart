import 'package:flutter/material.dart';
import 'package:text_to_speech_demo/custom_speech.dart';
import 'home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(centerTitle: true)),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => const MyHomePage());
            case '/custom':
              return MaterialPageRoute(
                  builder: (context) => const CustomPage());
            default:
              return MaterialPageRoute(
                  builder: (context) => const MyHomePage());
          }
        },
        initialRoute: '/');
  }
}

// List data = [
//   ko - KR,
//   mr - IN,
//   ru - RU,
//   zh - TW,
//   hu - HU,
//   th - TH,
//   ur - PK,
//   nb - NO,
//   da - DK,
//   tr - TR,
//   et - EE,
//   bs,
//   sw,
//   pt - PT,
//   vi - VN,
//   en - US,
//   sv - SE,
//   ar,
//   su - ID,
//   bn - BD,
//   gu - IN,
//   kn - IN,
//   el - GR,
//   hi - IN,
//   fi - FI,
//   km - KH,
//   bn - IN,
//   fr - FR,
//   uk - UA,
//   pa - IN,
//   en - AU,
//   lv - LV,
//   nl - NL,
//   fr - CA,
//   sr,
//   pt - BR,
//   ml - IN,
//   si - LK,
//   de - DE,
//   cs - CZ,
//   pl - PL,
//   sk - SK,
//   fil - PH,
//   it - IT,
//   ne - NP,
//   ms - MY,
//   hr,
//   en - NG,
//   nl - BE,
//   zh - CN,
//   es - ES,
//   cy,
//   ta - IN,
//   ja - JP,
//   bg - BG,
//   sq,
//   yue - HK,
//   en - IN,
//   es - US,
//   jv - ID,
//   id - ID,
//   te - IN,
//   ro - RO,
//   ca,
//   en - GB
// ]