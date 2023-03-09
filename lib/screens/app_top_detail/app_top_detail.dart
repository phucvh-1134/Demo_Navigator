import 'package:flutter/material.dart';

class AppTopDetailScreen extends StatelessWidget {
  const AppTopDetailScreen({required this.onBackButtonTapped, super.key});

  final ValueChanged<bool> onBackButtonTapped;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBackButtonTapped(true);
        return true;
      },
      child: const Scaffold(
        body: Center(child: Text('App Top Detail', style: TextStyle(fontSize: 28))),
      ),
    );
  }
}
