import 'package:demo_navigator/navigation/radio_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:demo_navigator/navigation/app_state.dart';
import 'package:demo_navigator/navigation/router_delegate/bottom_router_delegate.dart';

class HomePageScreen extends StatefulWidget {
  final AppState appState;
  final RadioDetailState radioDetailState;
  final BottomRouterDelegate _routerDelegate;

  HomePageScreen({required this.radioDetailState, required this.appState, super.key})
      : _routerDelegate = BottomRouterDelegate(appState, radioDetailState);

  @override
  State createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    final ChildBackButtonDispatcher backButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher();

    backButtonDispatcher.takePriority();

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Router(
          backButtonDispatcher: backButtonDispatcher,
          routerDelegate: widget._routerDelegate,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.radio), label: 'Radio')
        ],
        currentIndex: widget.appState.selectedIndex,
        onTap: (newIndex) {
          widget.appState.selectedIndex = newIndex;
        },
      ),
    );
  }
}

/*
class HomePageScreen extends StatelessWidget {
  HomePageScreen({required this.appState, super.key})
      : _routerDelegate = BottomRouterDelegate(appState);

  final AppState appState;
  final BottomRouterDelegate _routerDelegate;

  @override
  Widget build(BuildContext context) {
    final ChildBackButtonDispatcher backButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher();

    backButtonDispatcher.takePriority();

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Router(
          backButtonDispatcher: backButtonDispatcher,
          routerDelegate: _routerDelegate,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.radio), label: 'Radio')
        ],
        currentIndex: appState.selectedIndex,
        onTap: (newIndex) {
          appState.selectedIndex = newIndex;
        },
      ),
    );
  }
}
*/
