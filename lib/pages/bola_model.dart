import 'package:flutter/material.dart';
import 'dart:math';

class BolaModel extends InheritedWidget{
  final double radius;

  const BolaModel({
    required this.radius,
    required Widget child
}) : super (child: child);

  static BolaModel? of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<BolaModel>();
  }

  double get luasPermukaan => 4 * pi * radius * radius;

  @override
  bool updateShouldNotify(covariant BolaModel oldWidget) {
    return radius != oldWidget.radius;
  }
}