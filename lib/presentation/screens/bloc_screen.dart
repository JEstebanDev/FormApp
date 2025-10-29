import 'package:flutter/material.dart';

class BlockScreen extends StatelessWidget {
  const BlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh_rounded)),
        ],
      ),
      body: Center(child: Text("Counter Value")),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 12,
        children: [
          FloatingActionButton(
            onPressed: () {},
            heroTag: 1,
            child: const Text("+3"),
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: 2,
            child: const Text("+2"),
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: 3,
            child: const Text("+1"),
          ),
        ],
      ),
    );
  }
}
