import 'package:kata_app/kata_app.dart';
import 'package:test/test.dart';

void main() {
  group("Calculator (Kata)", () {
   test('Comma Test', () {
    int sum = add("1,5");
    expect(sum, 6);
   }); 
  });
}
