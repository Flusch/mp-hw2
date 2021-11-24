//Yavuz Selim GÜLER
//1306160016
import 'package:flutter/material.dart';
import 'toolbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      home: HomePage(),
    );
    return materialApp;
  }
}