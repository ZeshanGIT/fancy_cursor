import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Text(
          'HOVER AROUND',
          style: TextStyle(
            fontSize: 120,
            color: Colors.black12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
