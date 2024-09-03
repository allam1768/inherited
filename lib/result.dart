import 'package:aritmatik/inherited.dart';
import 'package:flutter/widgets.dart';

class ResultDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = ArithmeticState.of(context);
    if (state == null) return SizedBox.shrink();

    int result;
    switch (state.operation) {
      case '+':
        result = state.number1 + state.number2;
        break;
      case '-':
        result = state.number1 - state.number2;
        break;
      case '*':
        result = state.number1 * state.number2;
        break;
      case '/':
        result = state.number2 != 0 ? state.number1 ~/ state.number2 : 0;
        break;
      default:
        result = 0;
    }

    return Text(
      'Result: $result',
      style: TextStyle(fontSize: 24),
    );
  }
}
