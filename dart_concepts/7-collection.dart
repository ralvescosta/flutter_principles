void main() {
  /**
   * LIST
   */
  List<String> names = ['Eu', 'Tu'];
  print(names);

  // pass reference list
  var names2 = names;

  // copy values on new list
  names2 = [...names];
  print(names2);

  /**
   * SET
   */
  Set<String> halogens = {'first', 'second', 'first'};
  print(halogens);

  /**
   * Map // JSON
   */

  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };
  print(gifts);
  print(gifts['second']);

  var other = Map();
  other['first'] = 'Mango';
  print(other);

  Map<dynamic, dynamic> maper = {};
}
