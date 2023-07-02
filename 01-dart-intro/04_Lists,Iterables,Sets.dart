void main() {
  final numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10];

  print('List: $numbers');
  print('List: ${numbers.length}');
  print('First: ${numbers[0]}');
  print('First: ${numbers.first}');
  print('Last: ${numbers.last}');

  //Cuando se hace el reversed no se imprime como Iterable, no un List
  print('Reversed: ${numbers.reversed}');
  print('-----------------------------------------------');

  final reversedNumbers = numbers.reversed;
  print('Iterable: ${reversedNumbers}');
  print('List: ${reversedNumbers.toList()}');
  print('Set: ${reversedNumbers.toSet()}');

  final numbersGreaterThan5 = numbers.where((int num) {
    return num > 5;
  });
  print('>5: $numbersGreaterThan5');
}
