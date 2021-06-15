import 'package:flutter/material.dart';
import 'package:slide_page_app/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      //theme: ThemeData(fontFamily: 'Lato'),
      home: welcome(),
    );
  }
}
