import 'package:flutter/material.dart';
import 'bola_model.dart';

class DisplayLuasBola extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bolaModel = BolaModel.of(context);

    return Center(
      child: Text(
        "Luas permukaan bola: ${bolaModel?.luasPermukaan.toStringAsFixed(2)}",
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
