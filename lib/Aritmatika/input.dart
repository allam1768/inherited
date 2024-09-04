import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NumberInput extends StatelessWidget {
  final String label;
  final Function(int) onChanged;

  NumberInput({required this.label, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        onChanged(int.tryParse(value) ?? 0);
      },
    );
  }
}
