part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncress extends CounterEvent {
  final int value;
  const CounterIncress(this.value);
}

class CounterReset extends CounterEvent {
  const CounterReset();
}
