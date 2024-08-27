import 'package:flutter/material.dart';
import 'bmi_data.dart';
import 'bmi_form.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  double _weight = 0.0;
  double _height = 0.0;

  void _updateBmi(double weight, double height) {
    setState(() {
      _weight = weight;
      _height = height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BmiData(
      weight: _weight,
      height: _height,
      updateBmi: _updateBmi,
      child: Scaffold(

        body: const BmiForm(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
