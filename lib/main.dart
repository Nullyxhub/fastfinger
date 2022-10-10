import "package:flutter/material.dart";

import 'game.dart';

void main(){

  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: fastFinger(),
    );
  }
}

















