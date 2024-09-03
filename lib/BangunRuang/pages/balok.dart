import 'package:flutter/material.dart';
import 'package:menghitung_bangun_ruang/BangunRuang//widgets/my_button.dart';
import 'package:menghitung_bangun_ruang/BangunRuang//widgets/my_colors.dart';
import 'package:menghitung_bangun_ruang/BangunRuang//widgets/my_text_field.dart';
import 'package:menghitung_bangun_ruang/BangunRuang/pages/bangun_model.dart';
import 'display_luas.dart';

class Balok extends StatefulWidget {
  const Balok({super.key});

  @override
  State<Balok> createState() => _BalokState();
}

class _BalokState extends State<Balok> {
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();

  double _panjang = 0.0;
  double _lebar = 0.0;
  double _tinggi = 0.0;

  void _updateDimensions() {
    setState(() {
      _panjang = double.tryParse(_panjangController.text) ?? 0.0;
      _lebar = double.tryParse(_lebarController.text) ?? 0.0;
      _tinggi = double.tryParse(_tinggiController.text) ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menghitung Luas Balok"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextField(label: "Masukkan Panjang Balok", controller: _panjangController),
            const SizedBox(height: 10),
            MyTextField(label: "Masukkan Lebar Balok", controller: _lebarController),
            const SizedBox(height: 10),
            MyTextField(label: "Masukkan Tinggi Balok", controller: _tinggiController),
            const SizedBox(height: 20),
            MyButton(text: "Hitung", onPressed: _updateDimensions, color: buttonColor, fontSize: 12, textColor: buttonTextColor),
            const SizedBox(height: 20),
            Expanded(
              child: BangunModel(
                sisi: _panjang,
                sisi2: _lebar,
                sisi3: _tinggi,
                child: DisplayLuas(
                  type: 'Block',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
