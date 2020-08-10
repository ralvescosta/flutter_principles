main() {
  for (int i = 0; i <= 10; i++) {
    print('interaction 1: $i');
  }

  List<int> numbers = [1, 2, 3, 4];
  for (int j in numbers) {
    print('interaction 2: $j');
  }

  numbers.forEach((element) => print('interaction 3: $element'));
}
