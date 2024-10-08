import 'package:flutter/material.dart';
import 'package:menghitung_bangun_ruang/BangunRuang//widgets/my_button.dart';
import 'package:menghitung_bangun_ruang/BangunRuang//widgets/my_colors.dart';
import 'package:menghitung_bangun_ruang/BangunRuang//widgets/my_text_field.dart';
import 'package:menghitung_bangun_ruang/BangunRuang/pages/bangun_model.dart';
import 'package:menghitung_bangun_ruang/BangunRuang/pages/display_luas.dart';

class Kubus extends StatefulWidget {
  const Kubus({super.key});

  @override
  State<Kubus> createState() => _KubusState();
}

class _KubusState extends State<Kubus> {
  final TextEditingController _sisiController = TextEditingController();
  double _sisi = 0.0;

  void _updateSisi() {
    setState(() {
      _sisi = double.tryParse(_sisiController.text) ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menghitung Luas Kubus"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextField(label: "masukan panjang kubus", controller: _sisiController),
            const SizedBox(height: 20),
            MyButton(text: "Hitung", onPressed: _updateSisi, color: buttonColor, fontSize: 12, textColor: buttonTextColor),
            const SizedBox(height: 20),
            Expanded(
              child: BangunModel(
                sisi: _sisi,
                sisi2: 0,
                sisi3: 0,
                child: DisplayLuas(
                  type: "Cube",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
