import 'package:flutter/cupertino.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;

  const MyText({super.key,
    required this.text,
    required this.color,
    required this.fontsize,
    });

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      color: color,
      fontSize: fontsize,
    ),
    );
  }
}
