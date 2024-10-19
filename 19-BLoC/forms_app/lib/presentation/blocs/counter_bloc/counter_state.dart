part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactionCounter;

  const CounterState({
    required this.counter, 
    required this.transactionCounter
  });

  CounterState copyWith({
    int? counter,
    int? transactionCounter,
  }) => CounterState(
    counter: counter ?? this.counter, 
    transactionCounter: transactionCounter ?? this.transactionCounter
  );

  @override
  List<Object?> get props => [counter, transactionCounter];
}
