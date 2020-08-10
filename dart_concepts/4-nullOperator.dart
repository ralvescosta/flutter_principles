class Num {
  int num = 10;
}

main() {
  var n1 = new Num();
  var n2;
  int number;

  /**
   * Conventional use
   */
  if (n1 != null) {
    number = n1.num;
  }
  print(number);

  /**
   * null operator
   * ?., ??, ??=
   */
  number = n2?.num;
  number = n2?.num ?? 0; // default value
  print(number);
  print(n2 ??= 100); // if value are null assuming 100
}
