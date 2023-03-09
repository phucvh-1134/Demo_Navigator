import 'package:flutter/material.dart';

class AppTopScreen extends StatefulWidget {
  final ValueChanged<bool> moveToAppTopDetail;

  const AppTopScreen({required this.moveToAppTopDetail, super.key});

  @override
  State<StatefulWidget> createState() => AppTopScreenState();
}

class AppTopScreenState extends State<AppTopScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('App Top Screen', style: TextStyle(fontSize: 28))),
            ElevatedButton(
                onPressed: () => widget.moveToAppTopDetail(true),
                child: const Text('Move to app top detail screen')),
          ],
        ),
      )
    );
  }
}
