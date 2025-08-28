import 'package:kata_app/exceptions/invalid_number_exception.dart';
import 'package:kata_app/exceptions/negative_number_exception.dart';
import 'package:kata_app/kata_app.dart';
import 'package:test/test.dart';

void main() {
  group("Basic Calculator Test(Kata)", () {
   test('Invalid String', () {        
    expect(
      () => add("adsf, asdkfl, adsf"), 
      throwsA(isA<InvalidNumberException>())
      );
   });

   test('Negative number', () {
    expect(
      () => add("2,-1,3,-4"),
      throwsA(isA<NegativeNumberException>())
    );
   });

   test('With new line', () {
    int sum = add("1\n2,3");
    expect(sum, equals(6));
   });
  });
}
