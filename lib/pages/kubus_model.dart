import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KubusModel extends InheritedWidget{
  final double sisi;

  const KubusModel({
    required this.sisi,
    required Widget child,
}) : super(child: child);
  static KubusModel? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<KubusModel>();
  }
  double get luas => 6 * sisi * sisi;

  @override
  bool updateShouldNotify(covariant KubusModel oldWidget) {
    return oldWidget.sisi != sisi;
  }
}