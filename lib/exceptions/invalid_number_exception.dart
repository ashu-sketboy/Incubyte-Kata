class InvalidNumberException implements Exception {  
  const InvalidNumberException();

  @override
  String toString() {
    return 'Invalid Number Exception';
  }
}