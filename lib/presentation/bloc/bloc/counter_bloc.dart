import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<CounterIncress>(_onCounterIncress);
    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncress(CounterIncress event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1,
      ),
    );
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: 0));
  }

  void increaseBy([int value = 1]) {
    add(CounterIncress(value));
  }

  void resetCounter() {
    add(CounterReset());
  }
}
