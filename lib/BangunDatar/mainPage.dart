
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MainWidget.dart';

class mainPage extends StatefulWidget {
  final String type;
  const mainPage({
    required this.type,
    super.key
  });

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    String type = widget.type;

    final counted = BaseInherit.of(context).data.result.toString();
    final firstNum = BaseInherit.of(context).data.firstNum.toString();
    final secondNum = BaseInherit.of(context).data.secondNum.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('$type'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('First Number = $firstNum'),
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: TextField(
                maxLength: 10,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Fisrt Number"
                ),
                onChanged: (text) {
                  try{
                    int num = int.parse(text);
                    SetNum(num, true);
                  }
                  catch(e)
                  {
                    print("aaaaaaaaaaaaaaaaaaa $e");
                  }
                },
              ),
            ),
            if (type != "circle")... [
              Text('Second Number = $secondNum'),
              Container(
                margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
                child: TextField(
                  maxLength: 10,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Second Number"
                  ),
                  onChanged: (text) {
                    try{
                      int num = int.parse(text);
                      SetNum(num, false);
                    }
                    catch(e)
                    {
                      print("aaaaaaaaaaaaaaaaaaa $e");
                    }
                
                  },
                ),
              ),
            ],
            Text('Result = $counted'),
            ElevatedButton(
                onPressed: Calculate,
                child: Text("Calculate $type")
            )
          ],
        ),
      ),
    );
  }

  void Calculate(){
    final provider = BaseInherit.of(context);
    provider.calculate(widget.type);
  }
  void SetNum(int number, bool isFirstNum){
    final provider = BaseInherit.of(context);
    if(isFirstNum){
      provider.setFirstNum(number);
    }
    else{
      provider.setSecondNum(number);
    }
  }
}
