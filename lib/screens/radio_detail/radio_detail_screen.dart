import 'package:flutter/material.dart';

class RadioDetailScreen extends StatelessWidget {
  final int counter;
  const RadioDetailScreen({required this.counter, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Radio Detail Screen', style: TextStyle(fontSize: 28)),
          ),
          Text('$counter', style: Theme.of(context).textTheme.headlineMedium)
        ],
      ),
    );
  }
}