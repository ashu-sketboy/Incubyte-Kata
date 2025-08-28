import 'package:kata_app/exceptions/invalid_number_exception.dart';
import 'package:kata_app/exceptions/negative_number_exception.dart';
import 'package:kata_app/kata_app.dart';
import 'package:test/test.dart';

void main() {
  group("Basic Calculator Test(Kata)", () {

    test('Empty String', () {        
      int sum = add("");
      expect(sum, equals(0));
    });
    
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

   test("With Delemeter ';'", () {
      int sum = add("//;\n1;2;3");
      expect(sum, equals(6));
    });

    test("With Delemeter 'abc' and '\\n'", () {
      int sum = add("//abc\n1abc2\n3abc5");
      expect(sum, equals(11));
    });

    test("With Delemeter ',,' at end", () {      
      expect(() => add("//,,\n1,,2,,3,,6,,"), throwsA(isA<InvalidNumberException>()));
    });

    test("With only Delemeter ';'", () {      
      expect(() => add("//;\n;;"), throwsA(isA<InvalidNumberException>()));
    });
  });    
}
