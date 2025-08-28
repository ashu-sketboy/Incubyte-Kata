import 'package:kata_app/exceptions/invalid_number_exception.dart';
import 'package:kata_app/exceptions/negative_number_exception.dart';

int add(String number) {
  try {
    List<int> nums = getNumberFromString(number);  

    return nums.reduce((a, b) => a+b);
  } on NegativeNumberException {
    rethrow;
  } catch (e) {
    rethrow;
  }  
}

List<int> getNumberFromString(String number) {
  List<int> negativeNumbers = [];

  List<int> nums = number.split(',').map((String num) {
      int? number = int.tryParse(num);

      if (number == null) {
        throw InvalidNumberException();
      }      

      if (number < 0) {
        negativeNumbers.add(number);
      }

      return number;
    }).toList();  

    if (negativeNumbers.isNotEmpty) throw NegativeNumberException(negativeNumbers);

    return nums;
}
