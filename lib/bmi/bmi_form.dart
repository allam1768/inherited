import 'package:flutter/material.dart';
import 'bmi_data.dart';
import 'bmi_result.dart';

class BmiForm extends StatelessWidget {
  const BmiForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiData = BmiData.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BmiResult(),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Weight (kg)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (value) {
                      double weight = double.tryParse(value) ?? 0.0;
                      bmiData?.updateBmi(weight, bmiData.height);
                    },
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height (cm)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (value) {
                      double height = double.tryParse(value) ?? 0.0;
                      bmiData?.updateBmi(bmiData.weight, height);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),

        ],
      ),
    );
  }
}
