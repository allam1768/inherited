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

  @override
  Widget build(BuildContext context) {
    return BmiData(
      data: data,
      updateBmi: _updateBmi,
      child: Scaffold(

        body: const BmiForm(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
