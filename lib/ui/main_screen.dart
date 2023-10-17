import 'package:flutter/material.dart';
import 'buttons.dart';
import '../calculator.dart';

class CalculatorWidget extends StatefulWidget {
  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final Calculator _calculator = Calculator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  _calculator.current,
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          CalculatorButtons(_calculator, () => setState(() {})),
        ],
      ),
    );
  }
}
