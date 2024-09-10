import 'package:menghitung_bangun_ruang/BangunDatar/MainWidget.dart';
import 'package:menghitung_bangun_ruang/BangunDatar/mainList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../BangunDatar/mainPage.dart';
import 'bmi_data.dart';
import 'bmi_result.dart';

class BmiForm extends StatelessWidget {
  BmiForm({super.key});
  final List<String> shapes = <String>[
    "triangle",
    "circle",
    "square"
  ];

  @override
  Widget build(BuildContext context) {
    final bmiData = BaseInherit.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BmiResult(),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly!
                        ],

                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Weight (kg)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onChanged: (value) {
                          print(value);
                          try{
                            double num = double.parse(value);
                            bmiData.updateBmi(num, bmiData.data.height);
                          }
                          catch(e){
                            print(e);
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly!
                        ],

                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Height (cm)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onChanged: (value) {
                          print(value);
                          try{
                            double num = double.parse(value);
                            bmiData.updateBmi(bmiData.data.weight, num);
                          }
                          catch(e){
                            print(e);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

            ],
          ),
          // child: theList(),
        ),
      ),
    );
  }
}
class TheMods extends StatelessWidget {
  final String type;
  const TheMods({
    super.key,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          moveScreen(context, type);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
              Color(0x00000000)
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.deepOrange]),
              borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.all(2),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(18)
            ),
            child: Expanded(
              child: Column(
                children: [
                  Text(type, style: TextStyle(fontSize: 20, color: Colors.white),)
                ],
              ),
            ),
          ),
        )
    );
  }
}
void moveScreen(BuildContext context, String shape){
  Navigator.push(context, MaterialPageRoute(builder: (context) => mainPage(type: shape)),);
}