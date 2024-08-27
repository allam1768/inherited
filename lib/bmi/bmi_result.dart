import 'package:flutter/material.dart';
import 'bmi_data.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiData = BmiData.of(context);

    if (bmiData == null) {
      return const Center(child: Text('Data BMI tidak tersedia'));
    }

    double bmi = (bmiData.height > 0)
        ? (bmiData.weight / ((bmiData.height / 100) * (bmiData.height / 100)))
        : 0;

    String bmiCategory;
    IconData categoryIcon;
    Color categoryColor;

    if (bmi < 18.5) {
      bmiCategory = "Berat badan kurang";
      categoryIcon = Icons.sentiment_dissatisfied;
      categoryColor = Colors.orange;
    } else if (bmi < 24.9) {
      bmiCategory = "Normal";
      categoryIcon = Icons.sentiment_satisfied;
      categoryColor = Colors.green;
    } else if (bmi < 29.9) {
      bmiCategory = "Kegemukan";
      categoryIcon = Icons.sentiment_neutral;
      categoryColor = Colors.yellow;
    } else {
      bmiCategory = "Obesitas";
      categoryIcon = Icons.sentiment_very_dissatisfied;
      categoryColor = Colors.red;
    }

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'BMI mu: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: categoryColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  categoryIcon,
                  size: 40,
                  color: categoryColor,
                ),
                const SizedBox(width: 10),
                Text(
                  bmiCategory,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: categoryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
