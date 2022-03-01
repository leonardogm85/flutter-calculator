import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  CalculatorApp({
    Key? key,
  }) : super(key: key);

  final String title = 'Calculator';

  final String display = 'Display';

  final List<List<String>> buttons = [
    ['C', 'D', '%', '/'],
    ['7', '8', '9', '*'],
    ['4', '5', '6', '+'],
    ['1', '2', '3', '-'],
    ['0', '.', '='],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff6f6f6f),
        appBar: AppBar(
          backgroundColor: const Color(0xff6f6f6f),
          title: Text(title),
        ),
        body: Column(
          children: [
            CalculatorDisplay(
              text: display,
            ),
            CalculatorColumn(
              items: buttons,
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

class CalculatorColumn extends StatelessWidget {
  const CalculatorColumn({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<List<String>> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => CalculatorRow(
              items: item,
            ),
          )
          .toList(),
    );
  }
}

class CalculatorRow extends StatelessWidget {
  const CalculatorRow({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items
          .map(
            (item) => CalculatorButton(
              text: item,
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
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () {},
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
