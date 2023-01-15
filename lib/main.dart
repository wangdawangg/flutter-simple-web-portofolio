import 'package:flutter/material.dart';
import 'package:flutter_application_2/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UAS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Barlow',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 70,
            color: Colors.white,
            fontFamily: 'DMSerifDisplay'),
          headline2: TextStyle(
            fontSize: 55,
            color: Colors.white,
            fontFamily: 'DMSerifDisplay'),
          headline3: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontFamily: 'DMSerifDisplay'),
          subtitle1: TextStyle(fontSize: 30, color: Colors.grey[500]),
          subtitle2: TextStyle(fontSize: 20, color: Colors.grey[500]),
          bodyText1: TextStyle(fontSize: 20, color: Colors.white, height: 1.25),
          bodyText2: TextStyle(fontSize: 17, color: Colors.white, height: 1.25),
          caption: TextStyle(fontSize: 15, color: Colors.white, height: 1.25),
          button: TextStyle(fontSize: 17, color: Color(0xff1e1e24)))),
    home: HomePage(),
    );
  }
}
