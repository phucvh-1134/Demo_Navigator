import 'package:flutter/material.dart';

class SettingsDetailScreen extends StatelessWidget {
  final ValueChanged<bool> onMoveToAppTopDetailTapped;
  const SettingsDetailScreen({required this.onMoveToAppTopDetailTapped, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Settings Detail', style: TextStyle(fontSize: 28))),
            ElevatedButton(onPressed: () => onMoveToAppTopDetailTapped(true), child: const Text('Move To App Top Detail'))
          ],
        ),
      ),
    );
  }
}