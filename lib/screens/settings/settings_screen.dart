import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final ValueChanged<bool> onMoveToSettingsDetailScreen;

  const SettingsScreen({required this.onMoveToSettingsDetailScreen, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
          const Center(
            child: Text('Settings Screen', style: TextStyle(fontSize: 28)),
          ),
          ElevatedButton(
              onPressed: () => onMoveToSettingsDetailScreen(true),
              child: const Text('Move to Settings Detail'))
        ]),
      ),
    );
  }
}
