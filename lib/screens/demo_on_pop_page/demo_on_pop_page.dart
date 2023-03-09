import 'package:flutter/cupertino.dart';
import '../demo_page/demo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  List<Page<void>> pages = const <Page<void>>[
    DemoPage(key: ValueKey<String>('demo_page')),
    AnotherPage(key: ValueKey<String>('another_page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: pages,
      onPopPage: handleOnPopPage,
    );
  }

  bool handleOnPopPage(Route<dynamic> route, dynamic result) {
    final bool success = route.didPop(result);
    if (success) {
      pages.removeLast();
    }
    return success;
  }
}
