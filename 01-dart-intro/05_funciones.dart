void main() {
  print(greetEveryone());
  print(greetOne());

  print('Suma: ${addNumber(2, 3)}');
  print('Suma Arrow: ${addNumberArrow(3, 3)}');

  print(greetPerson(name: 'Rafael,', message: 'Hi'));
}

String greetEveryone() {
  return 'Hello everyone!';
}

String greetOne() => 'Hello one!';

int addNumber(int a, int b) {
  return a + b;
}

int addNumberArrow(int a, int b) => a + b;

//Para que ve sea opcional, [] define la opcionalidad
int addNumberOptional(int a, [int b = 0]) {
  //Condicional para que si b no tiene valor sea 0
  // b ??= 0; b = b ?? 0;
  return a + b;
}

//Esto es parametro por nombre, diferencia del parametro posicional que es el tradicional
String greetPerson({required String name, String? message = 'Hola,'}) {
  return '$message Rafa';
}
