main() {
  var s1 = 'Single quotes work well for string literals';
  var s2 = "Double quotes work just as well";
  var s3 = 'It\'s Single quotes';
  var s4 = "It's Double quotes";
  print(s1);
  print(s2);
  print(s3);
  print(s4);

  // RAW String
  var raw = r'In a raw string, not even \n gets special treatment.';
  print(raw);

  //multilane string
  var multilane = """

    I'm where

  """;
  print(multilane);
}
