import 'package:flutter/material.dart';

class LoginOptionsScreen extends StatelessWidget {
  const LoginOptionsScreen(
      {required this.onLoginTapped, required this.onRegisterTapped, Key? key})
      : super(key: key);

  final ValueChanged<bool> onLoginTapped;
  final ValueChanged<bool> onRegisterTapped;

  @override
  Widget build(BuildContext context) {
    print('Login Options');
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Login Options Screen', style: TextStyle(fontSize: 28)),
            ),
            ElevatedButton(
                onPressed: () {
                  onLoginTapped(true);
                },
                child: const Text('Go to Login')),
            ElevatedButton(
                onPressed: () => onRegisterTapped(true),
                child: const Text('Go to Register'))
          ],
        ),
      ),
    );
  }
}
