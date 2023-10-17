class Calculator {
  // expression shown on main calculator screen
  String _current = "0";
  String get current => _current;

  bool _leadingMinus = false;

  void onButtonPress(String value) {
    switch (value) {
      case "C":
        _clear();
        break;
      case "=":
        _evaluate();
        break;
      case "⌫":
        _removeLast();
        break;
      default:
        _add(value);
        break;
    }
  }

  // add digit/operator from button press to expression
  void _add(String value) {
    if (_current == "0") {
      if (value == "+" ||
          value == "-" ||
          value == "*" ||
          value == "/" ||
          value == "0") {
        return;
      }
      if (value == ".") {
        _current += value;
        return;
      }
      _current = value;
      return;
    }
    _current += value;
  }

  // erase last digit/operator from expression
  void _removeLast() {
    _current = _current.substring(0, _current.length - 1);
  }

  // clear the whole expression
  void _clear() {
    _current = "0";
  }

  List<num> _extractNumbers() {
    List<num> numbers = [];
    String currentNumber = "";

    for (int i = 0; i < _current.length; i++) {
      if (_current[i] == "+" || _current[i] == "*" || _current[i] == "/") {
        if (numbers.isEmpty && currentNumber.isEmpty) {
          currentNumber += _current[i];
          _leadingMinus = true;
        } else {
          numbers.add(num.parse(currentNumber));
          currentNumber = "";
        }
      } else {
        currentNumber += _current[i];
      }
    }
    if (currentNumber.isNotEmpty) {
      numbers.add(num.parse(currentNumber));
    }
    return numbers;
  }

  List<String> _extractOperators() {
    List<String> operators = [];

    for (int i = _leadingMinus ? 1 : 0; i < _current.length; i++) {
      if (_current[i] == "+" ||
          _current[i] == "-" ||
          _current[i] == "*" ||
          _current[i] == "/") {
        operators.add(_current[i]);
      }
    }
    return operators;
  }

  void _evaluate() {
    List<num> numbers = _extractNumbers();
    List<String> operators = _extractOperators();

    if (numbers.length - 1 != operators.length ||
        numbers.length == 1 ||
        numbers.isEmpty) {
      return;
    }

    num result = numbers[0];
    for (int i = 0; i < operators.length; i++) {
      switch (operators[i]) {
        case "+":
          result += numbers[i + 1];
          break;
        case "-":
          result -= numbers[i + 1];
          break;
        case "*":
          result *= numbers[i + 1];
          break;
        case "/":
          result /= numbers[i + 1];
          break;
      }
    }
    // check if num is integer
    if (result % 1 == 0) {
      _current = result.toInt().toString();
    } else {
      _current = result.toString();
    }
    _leadingMinus = false;
  }
}
