import 'package:flutter/material.dart';
import '../calculator.dart';

class CalculatorButtons extends StatelessWidget {
  final Calculator _calculator;
  final VoidCallback onButtonPressed;

  CalculatorButtons(this._calculator, this.onButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildButtonRow(["7", "8", "9", "+"]),
        _buildButtonRow(["4", "5", "6", "-"]),
        _buildButtonRow(["1", "2", "3", "*"]),
        _buildButtonRow(["0", "C", "=", "/"]),
        _buildButtonRow([".", "⌫"]),
      ],
    );
  }

  Widget _buildButtonRow(List<String> labels) {
    List<Widget> buttons = labels.map((label) {
      return Expanded(
        child: _buildButton(label),
      );
    }).toList();
    return Row(
      children: buttons,
    );
  }

  Widget _buildButton(String label) {
    return ElevatedButton(
        onPressed: () {
          _calculator.onButtonPress(label);
          onButtonPressed();
        },
        child: Text(label));
  }
}
