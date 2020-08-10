import 'dart:io';

// normal comment type

/// Documentation comment type
main() {
  stdout.writeln('What is your name ?');
  String name = stdin.readLineSync();
  print('My name is $name');
}
