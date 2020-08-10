class Person {
  String name;
  int age;
  final name2; // type will be defined by inferred value, change only on constructor
  static const int age2 = 10;

  //constructor
  // Person(String name, [int age = 18]) {
  //   this.name = name;
  //   this.age = age;
  // }
  Person(this.name, this.name2, [this.age = 18]);

  void showOutput() {
    print('Person Name: $name Age: $age');
  }
}

void main() {
  Person p1 = Person("Jhone", 'Doe');

  p1.showOutput();
}
