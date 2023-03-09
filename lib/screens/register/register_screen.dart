import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({required this.onMoveToLoginTapped, super.key});

  final ValueChanged<bool> onMoveToLoginTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Register Screen', style: TextStyle(fontSize: 28))),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Back to Login Options Screen')
          ),
          ElevatedButton(
              onPressed: () => onMoveToLoginTapped(true),
              child: const Text('Move To Login Screen')
          ),
        ],
      ),
    );
  }
}