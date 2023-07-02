void main() {
  emitNumbers().listen((int value) {
    print('Stream value: $value');
  });
}

Stream<int> emitNumbers() async* {
  final valuesToEmit = [1, 2, 3, 4, 5, 6];
  for (int cont in valuesToEmit) {
    await Future.delayed(const Duration(seconds: 1));
    yield cont; //Ceder el valor
  }
}
