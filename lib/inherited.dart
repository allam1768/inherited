import 'package:flutter/material.dart';

class ArithmeticState extends InheritedWidget {
  final int number1;
  final int number2;
  final String operation;
  final Function(int, int, String) updateValues;

  ArithmeticState({
    required this.number1,
    required this.number2,
    required this.operation,
    required this.updateValues,
    required Widget child,
  }) : super(child: child);

  static ArithmeticState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ArithmeticState>();
  }

  @override
  bool updateShouldNotify(ArithmeticState oldWidget) {
    return number1 != oldWidget.number1 ||
           number2 != oldWidget.number2 ||
           operation != oldWidget.operation;
  }
}
