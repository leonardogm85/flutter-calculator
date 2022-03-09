import 'package:flutter/material.dart';

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

  String _display = 'Display';

  void _onPressed(String button) {
    setState(() {
      _display = 'Typed "$button" button';
    });
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
              onPressedButton: _onPressed,
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
