import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final ValueChanged<bool> onMoveToHomePage;
  final ValueChanged<bool> onBackToLoginOptions;

  const LoginScreen(
      {required this.onMoveToHomePage,
      required this.onBackToLoginOptions,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Login', style: TextStyle(fontSize: 28))),
            ElevatedButton(
                onPressed: () => onBackToLoginOptions(true),
                child: const Text('Back to Login Options')),
            ElevatedButton(
                onPressed: () => onMoveToHomePage(true),
                child: const Text('Move to Home Page'))
          ],
        ),
      ),
    );
  }
}