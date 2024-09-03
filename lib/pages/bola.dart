import 'package:flutter/material.dart';
import 'package:menghitung_bangun_ruang/widgets/my_button.dart';
import 'package:menghitung_bangun_ruang/widgets/my_colors.dart';
import 'package:menghitung_bangun_ruang/widgets/my_text_field.dart';
import 'bola_model.dart';
import 'display_luas_bola.dart';

class Bola extends StatefulWidget {
  const Bola({super.key});

  @override
  State<Bola> createState() => _BolaState();
}

class _BolaState extends State<Bola> {
  final TextEditingController _radiusController = TextEditingController();

  double _radius = 0.0;

  void _updateRadius() {
    setState(() {
      _radius = double.tryParse(_radiusController.text) ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menghitung Luas Bola"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextField(label: "Masukkan Radius Bola", controller: _radiusController),
            const SizedBox(height: 20),
            MyButton(text: "Hitung", onPressed: _updateRadius, color: buttonColor, fontSize: 12, textColor: buttonTextColor),
            const SizedBox(height: 20),
            Expanded(
              child: BolaModel(
                radius: _radius,
                child: DisplayLuasBola(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
