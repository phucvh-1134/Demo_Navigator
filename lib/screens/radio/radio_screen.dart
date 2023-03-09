import 'package:demo_navigator/navigation/arguments/radio_detail_argument.dart';
import 'package:demo_navigator/navigation/radio_detail_state.dart';
import 'package:flutter/material.dart';

class RadioScreen extends StatefulWidget {
  final ValueChanged<RadioDetailArgument> radioDetailArgument;
  final RadioDetailState radioDetailState;

  const RadioScreen(
      {required this.radioDetailState, required this.radioDetailArgument,
      super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {

  void _incrementCounter() {
    setState(() {
      widget.radioDetailState.counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Radio Screen', style: TextStyle(fontSize: 28))),
          ElevatedButton(
              onPressed: () {
                return widget.radioDetailArgument(RadioDetailArgument(
                    hasMoveToRadioDetail: true, counter: widget.radioDetailState.counter));
              },
              child: const Text('Move to Radio Detail')),
          Text(
            '${widget.radioDetailState.counter}',
            style: Theme.of(context).textTheme.headlineMedium,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
