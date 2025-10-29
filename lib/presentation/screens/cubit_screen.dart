import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/bloc/cubit/counter_cubit.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  void resetCounter(BuildContext context) {
    context.read<CounterCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    // 1: Way to get the information
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${counterState.counter}'),
        actions: [
          IconButton(
            onPressed: () => resetCounter(context),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          Center(
            child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                // 2: Way to get the information
                return Text("Counter Value: ${state.counter}");
              },
            ),
          ),
          Center(
            child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                // 3: Way to get the information
                return context.select((CounterCubit value) {
                  return Text("Counter Value: ${value.state.counter}");
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 12,
        children: [
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 3),
            heroTag: 1,
            child: const Text("+3"),
          ),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 2),
            heroTag: 2,
            child: const Text("+2"),
          ),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context),
            heroTag: 3,
            child: const Text("+1"),
          ),
        ],
      ),
    );
  }
}
