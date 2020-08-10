main() {
  /**
   dart primitive variables types

   int
   double
   num (int or double)
   String
   bool
   dynamic
   */

  int amount1 = 100;
  var amount2 = 200;
  print('Amount1: $amount1 | amount2: $amount2');

  double dAmount1 = 100.1;
  var dAmount2 = 200.22;
  print('Amount1: $dAmount1 | Amount1: $dAmount2');

  String name1 = "Fulano";
  var name2 = "Detal";
  print('Name1: $name1 | Name2: $name2');

  bool isTruthy1 = true;
  var isTruthy2 = true;
  print('True1: $isTruthy1 | Treu2: $isTruthy2');

  dynamic numberString = 100;
  print('Dynamic Number: $numberString');

  numberString = "100";
  print('Dynamic String: $numberString');

  const number = 1;
  print(number);
}
