import 'package:kata_app/exceptions/invalid_number_exception.dart';
import 'package:kata_app/exceptions/negative_number_exception.dart';
import 'package:kata_app/kata_app.dart';
import 'package:test/test.dart';

void main() {
  group("Basic Calculator Test(Kata)", () {
   test('Invalid String', () {        
    expect(
      () => getNumberFromString("adsf, asdkfl, adsf"), 
      throwsA(isA<InvalidNumberException>())
      );
   });

   test('Negative number', () {
    expect(
      () => getNumberFromString("2,-1,3,-4"),
      throwsA(isA<NegativeNumberException>())
    );
   });
  });
}
