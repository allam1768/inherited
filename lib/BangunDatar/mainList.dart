
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainPage.dart';

class theList extends StatefulWidget {
  const theList({super.key});

  @override
  State<theList> createState() => _theListState();
}

class _theListState extends State<theList> {
  final List<String> shapes = <String>[
    "triangle",
    "circle",
    "square"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bangun Datar", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white
        ),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: shapes.length,
              itemBuilder: (context, index){
                return TheMods(type: shapes[index]);
              },
            )
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
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          shadowColor: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.deepOrange]),
              borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.all(2),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18)
            ),
            child: Row(
              children: [
                Expanded(child: Container()),
                Text(type, style: TextStyle(fontSize: 20, color: Colors.black),),
                Expanded(child: Container()),
              ],
            ),
          ),
        )
    );
  }
}
void moveScreen(BuildContext context, String shape){
  Navigator.push(context, MaterialPageRoute(builder: (context) => mainPage(type: shape)),);
}