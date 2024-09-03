import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menghitung_bangun_ruang/pages/balok.dart';
import 'package:menghitung_bangun_ruang/pages/bola.dart';
import 'package:menghitung_bangun_ruang/pages/kubus.dart';
import 'package:menghitung_bangun_ruang/widgets/my_button.dart';
import 'package:menghitung_bangun_ruang/widgets/my_colors.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menghitung Luas Bangun Ruang"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MyButton(
              text: "Balok",
              color: buttonColor,
              fontSize: 20.0,
              textColor: buttonTextColor,
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Balok()),
                );
              },
            ),
            const SizedBox(height: 20,),
            MyButton(
              text: "Kubus",
              color: buttonColor,
              fontSize: 20.0,
              textColor: buttonTextColor,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Kubus()),
                );
              },
            ),
            const SizedBox(height: 20,),
            MyButton(
              text: "Bola",
              color: buttonColor,
              fontSize: 20.0,
              textColor: buttonTextColor,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bola()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

