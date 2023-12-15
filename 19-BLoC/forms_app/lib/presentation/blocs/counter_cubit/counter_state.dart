part of 'counter_cubit.dart';

class CounterState {
  final int counter;
  final int transactionCounter;

  CounterState({
    required this.counter, 
    required this.transactionCounter
  });

  copyWith({
    int? counter,
    int? transactionCounter,
  }) => CounterState(
    counter: counter ?? this.counter, 
    transactionCounter: transactionCounter ?? this.transactionCounter
  );

}
