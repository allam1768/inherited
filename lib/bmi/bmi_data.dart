import 'package:flutter/material.dart';

class BmiData extends InheritedWidget {
  final Data data;
  final Function(double, double) updateBmi;
  final Function(String) calculate;
  final Function(int) firstParamSetter;
  final Function(int) secondParamSetter;

  const BmiData({
    Key? key,
    required this.data,
    required this.updateBmi,
    required this.calculate,
    required this.firstParamSetter,
    required this.secondParamSetter,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant BmiData oldWidget) {
    return data != oldWidget.data;
  }

  static BmiData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BmiData>();
  }
}
class Data{
  final int result;
  final int firstNum;
  final int secondNum;
  final double weight;
  final double height;

  const Data({
    this.result = 0,
    this.firstNum = 0,
    this.secondNum = 0,
    this.weight = 0,
    this.height = 0,
  });

  Data copy(int result, int firstNum, int secondNum, double height, double weight){
    return Data(
      result: result ?? this.result,
      firstNum: firstNum ?? this.firstNum,
      secondNum: secondNum ?? this.secondNum,
      height: height ?? this.height,
      weight: weight?? this.weight
    );
  }

  @override
  bool operator == (Object other){
    return identical(this, other) ||
      other is Data &&
        runtimeType == other.runtimeType &&
        result == other.result &&
        firstNum == other.firstNum &&
        secondNum == other.secondNum &&
        height == other.height &&
        weight == other.weight
    ;
  }

  @override
  int get hashCode => result.hashCode ^ firstNum.hashCode ^ secondNum.hashCode ^ weight.hashCode ^ height.hashCode;
}
