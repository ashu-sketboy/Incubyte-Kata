int add(String number) {
  List<int> nums = number.split(',').map((String num) {
    return int.parse(num);
  }).toList();

  return nums.reduce((a, b) => a+b);
}
