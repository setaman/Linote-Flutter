import 'package:flutter/material.dart';
import 'package:linote/pages/home.dart';

void main() => runApp(Linote());

class Linote extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Linote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Quicksand'
      ),
      home: Home()
    );
  }
}
