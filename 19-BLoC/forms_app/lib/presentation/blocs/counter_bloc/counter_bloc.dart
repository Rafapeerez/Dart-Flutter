import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  
  //Constructor
  CounterBloc() : super(const CounterState(counter: 10, transactionCounter: 0)) {
    
    //handler
    on<CounterIncreased>((event, emit) {
      emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCounter: state.transactionCounter + 1
      ));
    });
  }
}
