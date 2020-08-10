void main() {
  showOutput(square(3));
  showOutput(namedParameters(num2: 1, num1: 3));
  showOutput(positionalParameters(1));
}

dynamic square(dynamic num) {
  return num * num;
}

void showOutput(dynamic msg) {
  print(msg);
}

/**
 * Named parameters is optional
 */
dynamic namedParameters({dynamic num1 = 0, dynamic num2 = 0}) {
  return num1 + num2;
}

/**
 * Positional parameters, when use [] on parameters, this parameters is optional
 */
dynamic positionalParameters(dynamic num1, [dynamic num2]) {
  return num1 + (num2 ?? 0);
}
