import 'package:flutter/material.dart';
import 'kubus_model.dart';  // Import model InheritedWidget yang sudah kita buat

class DisplayLuas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kubusModel = KubusModel.of(context);

    return Center(
      child: Text(
        "Luas permukaan kubus: ${kubusModel?.luas.toStringAsFixed(2)}",
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
