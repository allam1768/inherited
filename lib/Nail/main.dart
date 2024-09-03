import 'package:aritmatika/MainWidget.dart';
import 'package:aritmatika/mainPage.dart';
import 'package:flutter/material.dart';

import 'mainList.dart';

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
        home: theList(),
      ),
    );
  }
}

