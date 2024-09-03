import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:menghitung_bangun_ruang/Aritmatika/aritmatika.dart';

class OperationSelector extends StatelessWidget {
  final Function(String) onOperationSelected;

  OperationSelector({required this.onOperationSelected});

  @override
  Widget build(BuildContext context) {
    final arithmeticState = ArithmeticState.of(context);

    return DropdownButton<String>(
      value: arithmeticState?.operation ?? '+',
      items: ['+', '-', '*', '/'].map((String operation) {
        return DropdownMenuItem<String>(
          value: operation,
          child: Text(operation),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          onOperationSelected(newValue);
        }
      },
    );
  }
}
