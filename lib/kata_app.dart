import 'package:kata_app/exceptions/invalid_number_exception.dart';

int add(String number) {
  try {
    List<int> nums = number.split(',').map((String num) {
      int? number = int.tryParse(num);

      if (number == null) {
        throw InvalidNumberException();
      }

      return number;
    }).toList();

    return nums.reduce((a, b) => a+b);
  } catch (e) {
    rethrow;
  }
  
}
