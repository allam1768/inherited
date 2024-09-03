import 'package:flutter/material.dart';

class ArithmeticState extends InheritedWidget {
  final int number1;
  final int number2;
  final String operation;
  final Function(int, int, String) updateValues;

  ArithmeticState({
    required this.number1,
    required this.number2,
    required this.operation,
    required this.updateValues,
    required Widget child,
  }) : super(child: child);

  static ArithmeticState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ArithmeticState>();
  }

  @override
  bool updateShouldNotify(ArithmeticState oldWidget) {
    return number1 != oldWidget.number1 ||
        number2 != oldWidget.number2 ||
        operation != oldWidget.operation;
  }
}

class NumberInput extends StatelessWidget {
  final String label;
  final Function(int) onChanged;

  NumberInput({required this.label, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        onChanged(int.tryParse(value) ?? 0);
      },
    );
  }
}

class OperationSelector extends StatelessWidget {
  final Function(String) onOperationSelected;

  OperationSelector({required this.onOperationSelected});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: ArithmeticState.of(context)?.operation ?? '+',
      items: ['+', '-', '*', '/'].map((String operation) {
        return DropdownMenuItem<String>(
          value: operation,
          child: Text(operation),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          onOperationSelected(newValue);
        }
      },
    );
  }
}

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

class ArithmeticApp extends StatefulWidget {
  @override
  _ArithmeticAppState createState() => _ArithmeticAppState();
}

class _ArithmeticAppState extends State<ArithmeticApp> {
  int _number1 = 0;
  int _number2 = 0;
  String _operation = '+';

  void _updateValues(int number1, int number2, String operation) {
    setState(() {
      _number1 = number1;
      _number2 = number2;
      _operation = operation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ArithmeticState(
      number1: _number1,
      number2: _number2,
      operation: _operation,
      updateValues: _updateValues,
      child: Scaffold(
        appBar: AppBar(title: Text('Arithmetic App')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              NumberInput(
                label: 'Number 1',
                onChanged: (value) => _updateValues(value, _number2, _operation),
              ),
              NumberInput(
                label: 'Number 2',
                onChanged: (value) => _updateValues(_number1, value, _operation),
              ),
              OperationSelector(
                onOperationSelected: (operation) =>
                    _updateValues(_number1, _number2, operation),
              ),
              SizedBox(height: 20),
              ResultDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ArithmeticApp(),
  ));
}
