class NegativeNumberException implements Exception {
  List<int> numbers;

  NegativeNumberException(this.numbers);

  @override
  String toString() {    
    return "negative numbers not allowed ${numbers.join(", ")}";
  }
}