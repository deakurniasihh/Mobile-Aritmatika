import 'package:flutter/material.dart';
import 'package:latihan/calculator.dart';
import 'package:latihan/firstpage.dart';
import 'package:latihan/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: WelcomeScreen(),
    );
  }
}
