
import 'package:flutter/material.dart';
import 'package:menghitung_bangun_ruang/BangunRuang/dashboard.dart';
import 'package:menghitung_bangun_ruang/HomeScreen.dart';
import 'package:menghitung_bangun_ruang/bmi/bmi_form.dart';

import 'Aritmatika/aritmatika.dart';
import 'BangunDatar/MainWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

