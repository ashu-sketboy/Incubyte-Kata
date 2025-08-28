import 'package:kata_app/exceptions/invalid_number_exception.dart';
import 'package:kata_app/exceptions/negative_number_exception.dart';

int add(String number) {
  try {    
    if (number.trim().isEmpty) return 0;
    List<int> nums = _getNumberFromString(number);  

    return nums.reduce((a, b) => a+b);
  } on NegativeNumberException {
    rethrow;
  } catch (e) {
    rethrow;
  }  
}

List<int> _getNumberFromString(String number) {
  List<String> numAndDelimiter = _filterString(number);  
  number = numAndDelimiter[0];
  String delimiter = numAndDelimiter[1];  
  List<int> negativeNumbers = [];

  List<int> nums = number.split(delimiter).map((String num) {
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

List<String> _filterString(String number) {
  List<String> numDelimiter = _findDelimiter(number);
  number = numDelimiter[0];
  String delimiter = numDelimiter[1];

  return [number.replaceAll("\n", delimiter), delimiter];  
}

List<String> _findDelimiter(String number) {
  if (number.substring(0, 2) != "//") {
    return [number, ','];
  }

  String delimiter = '';  
  for (int i = 2; i < number.length; i++) {
    if (number[i] == '\n') {
      number = number.substring(i+1);
      break;
    }

    delimiter += number[i];
  }

  return [number, delimiter];
}