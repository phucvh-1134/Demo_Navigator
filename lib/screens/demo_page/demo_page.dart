import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoPage extends Page<void> {
  const DemoPage({required LocalKey key}) : super(key: key);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
        builder: (BuildContext context) => const Text('Demo Page')
    );
  }
}

class AnotherPage extends Page<void> {
  const AnotherPage({required LocalKey key}) : super(key: key);

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
        builder: (BuildContext context) => const Text('Another Page'));
  }
}

List<Page<void>> pages = const <Page<void>>[
  DemoPage(key: ValueKey<String>('demo_page')),
  AnotherPage(key: ValueKey<String>('another_page')),
];
