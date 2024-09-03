import 'package:flutter/material.dart';
import 'balok_model.dart';

class DisplayLuasBalok extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final balokModel = BalokModel.of(context);

    return Center(
      child: Text(
        "Luas permukaan balok: ${balokModel?.luas.toStringAsFixed(2)}",
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}