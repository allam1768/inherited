import 'package:flutter/material.dart';
import 'package:menghitung_bangun_ruang/BangunRuang/pages/bangun_model.dart';

class DisplayLuas extends StatelessWidget {
  final String type;

  const DisplayLuas({super.key, required this.type});
  @override
  Widget build(BuildContext context) {
    final model = BangunModel.of(context);

    switch (type){
      case("Cube"):
        return Center(
          child: Text(
            "Luas permukaan: ${model?.getResult(type).toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 24),
          ),
        );
        break;
      case("Ball"):
        return Center(
          child: Text(
            "Luas permukaan: ${model?.getResult(type).toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 24),
          ),
        );
        break;
      case("Block"):
        return Center(
          child: Text(
            "Luas permukaan: ${model?.getResult(type).toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 24),
          ),
        );
        break;
      default:
        return const Center(
          child: Text(
            "Luas permukaan: null",
            style: TextStyle(fontSize: 24),
          ),
        );
        break;
    }
  }
}