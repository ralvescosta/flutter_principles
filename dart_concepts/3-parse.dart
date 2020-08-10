main() {
  /**
   * To number
   */
  var parseInt = int.parse('1', radix: 10);
  print(parseInt);
  parseInt = int.parse('ff', radix: 16);
  print(parseInt);

  var parseDouble = double.parse('1.1');
  print(parseDouble);

  /**
   * To String
   */
  String oneAsString = 1.toString();
  print(oneAsString);

  String piAsString = 3.14158.toStringAsFixed(2);
  print(piAsString);
}
