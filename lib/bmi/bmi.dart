import 'dart:math';

import 'package:flutter/material.dart';
import 'bmi_data.dart';
import 'bmi_form.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  Data data = Data();

  void _updateBmi(double weight, double height) {
    setState(() {
      double tempWeight = weight;
      double tempHeight = height;
      data.copy(data.result, data.firstNum, data.firstNum, height, weight);
    });
  }
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
    return BmiData(
      data: data,
      calculate: calculate,
      secondParamSetter: setSecondNum,
      firstParamSetter: setFirstNum,
      updateBmi: _updateBmi,
      child: Scaffold(

        body: BmiForm(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
