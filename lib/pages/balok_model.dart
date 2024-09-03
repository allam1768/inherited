import 'package:flutter/material.dart';


class BalokModel extends InheritedWidget{
  final double panjang;
  final double tinggi;
  final double lebar;

  const BalokModel({
    required this.lebar,
    required this.panjang,
    required this. tinggi,
    required Widget child
  }) : super (child: child);

  static BalokModel? of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<BalokModel>();
  }
  double get luas => 2* (panjang * lebar + lebar * tinggi + panjang * tinggi);
  @override
  bool updateShouldNotify(covariant BalokModel oldWidget) {
    return panjang != oldWidget.panjang ||
        tinggi != oldWidget.tinggi ||
        lebar != oldWidget.lebar;
  }}