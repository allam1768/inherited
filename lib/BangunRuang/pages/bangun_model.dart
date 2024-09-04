import 'package:flutter/material.dart';
import 'dart:math';

class BangunModel extends InheritedWidget{
  final double sisi;
  final double sisi2;
  final double sisi3;

  const BangunModel({
    required this.sisi,
    required this.sisi2,
    required this.sisi3,
    required Widget child
}) : super (child: child);

  static BangunModel? of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<BangunModel>();
  }

  double getResult(String type){
    switch(type){
      case ("Cube"):
        return 6 * sisi * sisi;
        break;
      case ("Ball"):
        return 4 * pi * sisi * sisi;
        break;
      case ("Block"):
        return 2 * (sisi * sisi2 + sisi2 * sisi3 + sisi * sisi3);
        break;
      default:
        return 1 * 0;
        break;
    }
  }
  double get luasPermukaanBola => 4 * pi * sisi * sisi;
  double get luasPermukaanKubus => 6 * sisi * sisi;
  double get luasPermukaanBalok => 2* (sisi * sisi2 + sisi2 * sisi3 + sisi * sisi3);

  @override
  bool updateShouldNotify(covariant BangunModel oldWidget) {
    return sisi != oldWidget.sisi || sisi3 != oldWidget.sisi3 || sisi2 != oldWidget.sisi2;
  }
}