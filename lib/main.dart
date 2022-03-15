import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({
    Key? key,
  }) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final String _title = 'Calculator';

  final List<List<String>> _buttons = [
    ['C', 'D', '%', '/'],
    ['7', '8', '9', '*'],
    ['4', '5', '6', '+'],
    ['1', '2', '3', '-'],
    ['0', '.', '='],
  ];

  String _display = '0.0';

  void _set(String button) {
    setState(() {
      switch (button) {
        case 'C':
          _display = _reset();
          break;
        case 'D':
          _display = _delete();
          break;
        case '=':
          _display = _calculate();
          break;
        default:
          _display = _concat(button);
      }
    });
  }

  String _concat(String button) {
    if (_display == '0.0') {
      return button;
    }

    return _display + button;
  }

  String _delete() {
    return _display.substring(0, _display.length - 1);
  }

  String _reset() {
    return _display = '0.0';
  }

  String _calculate() {
    return Parser()
        .parse(_display)
        .evaluate(EvaluationType.REAL, ContextModel())
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff6f6f6f),
        appBar: AppBar(
          backgroundColor: const Color(0xff6f6f6f),
          title: Text(_title),
        ),
        body: Column(
          children: [
            CalculatorDisplay(
              text: _display,
            ),
            CalculatorBody(
              calculatorButtons: _buttons,
              onPressedButton: _set,
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      height: 100,
      decoration: const BoxDecoration(
        color: Color(0xffced2d3),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 40,
          color: Color(0xff6f6f6f),
        ),
      ),
    );
  }
}

class CalculatorBody extends StatelessWidget {
  const CalculatorBody(
      {Key? key,
      required this.calculatorButtons,
      required this.onPressedButton})
      : super(key: key);

  final List<List<String>> calculatorButtons;
  final void Function(String) onPressedButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: calculatorButtons
          .map(
            (rowButtons) => Row(
              children: rowButtons
                  .map(
                    (itemButton) => CalculatorButton(
                      text: itemButton,
                      onPressed: onPressedButton,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () => onPressed(text),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            primary: const Color(0xffced2d3),
            onPrimary: const Color(0xff6f6f6f),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
