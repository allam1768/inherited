import 'package:flutter/material.dart';

class BmiData extends InheritedWidget {
  final double weight;
  final double height;
  final Function(double, double) updateBmi;

  const BmiData({
    Key? key,
    required this.weight,
    required this.height,
    required this.updateBmi,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant BmiData oldWidget) {
    return weight != oldWidget.weight || height != oldWidget.height;
  }

  static BmiData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BmiData>();
  }
}
