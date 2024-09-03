import 'dart:math';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'baseData.dart';

class BaseWidget extends StatefulWidget {
  final Widget child;
  const BaseWidget({
    super.key,
    required this.child
  });

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  baseData data = baseData();

  void calculate(String type){
    setState(() {
      int res = 0;
      switch(type){
        case("triangle"):
          res = ((data.firstNum * data.secondNum)/2).round();
          break;
        case("circle"):
          res = (pi*pow(data.firstNum, 2)).round();
          break;
        case("square"):
          res = (data.firstNum * data.secondNum).round();
          break;
      }
      final newData = data.copy(res, data.firstNum, data.secondNum, data.height, data.weight);
      data = newData;
    });
  }
  void updateBmi(double weight, double height) {
    setState(() {
      double tempWeight = weight;
      double tempHeight = height;
      final newData = data.copy(data.result, data.firstNum, data.firstNum, tempHeight, tempWeight);
      data = newData;
    });
  }

  void setFirstNum(int num){
    setState(() {
      final firstNum = num;

      final newData = data.copy(data.result, firstNum, data.secondNum, data.height, data.weight);
      data = newData;
    });
  }
  void setSecondNum(int num){
    setState(() {
      final secondNum = num;

      final newData = data.copy(data.result, data.firstNum, secondNum, data.height, data.weight);
      data = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseInherit(
      data: data,
      child: widget.child,
      baseWidget: this
    );
  }
}


class BaseInherit extends InheritedWidget{
  final baseData data;
  final _BaseWidgetState baseWidget;

  const BaseInherit({
    super.key,
    required this.data,
    required this.baseWidget,
    required Widget child,
  }) : super(child: child);

  static _BaseWidgetState of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<BaseInherit>()!.baseWidget;
  }

  @override
  bool updateShouldNotify(BaseInherit oldWidget){
    return oldWidget.data != data;
  }
}