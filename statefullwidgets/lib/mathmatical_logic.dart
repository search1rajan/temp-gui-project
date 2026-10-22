class MathmaticalLogic {
  // addition ka logic = me implement kiya gya hai

  double add(String expression) {
    List<String> numbers = expression.split('+');

    double result = 0;

    for (String number in numbers) {
      result += double.parse(number);
    }

    return result;
  }

  // subtraction ka logic

  double sub(String expression) {
    List<String> numbers = expression.split('-');

    double result = double.parse(numbers[0]);

    for (int i = 1; i < numbers.length; i++) {
      result -= double.parse(numbers[i]);
    }

    return result;
  }
}
