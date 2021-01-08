import 'package:fancy_cursor/fancy_cursor.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FancyCursor(
        color: Colors.white,
        curve: Curves.linear,
        delay: Duration(milliseconds: 300),
        size: 16,
        trailCustomCursor: Image.asset('assets/loading.gif'),
        child: HomePage(),
      ),
    );
  }
}
