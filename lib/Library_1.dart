void main() {

  // TASK 1
  print("TASK 1");

  int number = 5;

  for (int i = 1; i <= 10; i++) {
    print("$number * $i = ${number * i}");
  }


  // TASK 2
  print("TASK 2");

  int day = 5;
  int month = 9;
  int year = 2026;

  if (day < 30) {
    day++;
  } else {
    day = 1;
    month++;

    if (month > 12) {
      month = 1;
      year++;
    }
  }

  print("$day.$month.$year");


  // TASK 3
  print("TASK 3");

  String text = "flutter mobile development";
  int count = 0;

  for (int i = 0; i < text.length; i++) {
    if ("aeiou".contains(text[i])) {
      count++;
    }
  }

  print("Vowels: $count");


  // TASK 4
  print("TASK 4");

  List<int> numbers = [14, 88, 3, 42, 99, 12, 67];

  int min = numbers[0];
  int max = numbers[0];

  for (int number in numbers) {
    if (number < min) {
      min = number;
    }

    if (number > max) {
      max = number;
    }
  }

  print("Min: $min");
  print("Max: $max");


  // TASK 5
  print("TASK 5");

  int number1 = 3;
  bool prime = true;

  for (int i = 2; i < number1; i++) {
    if (number1 % i == 0) {
      prime = false;
    }
  }

  if (prime) {
    print("$number1 -> prime number");
  } else {
    print("$number1 -> not prime number");
  }


  int number2 = 6;
  bool prime2 = true;

  for (int i = 2; i < number2; i++) {
    if (number2 % i == 0) {
      prime2 = false;
    }
  }

  if (prime2) {
    print("$number2 -> prime number");
  } else {
    print("$number2 -> not prime number");
  }
}