
import 'package:flutter/material.dart';
import 'package:menghitung_bangun_ruang/Aritmatika/aritmatika.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ArithmeticApp(),
    );
  }
}
