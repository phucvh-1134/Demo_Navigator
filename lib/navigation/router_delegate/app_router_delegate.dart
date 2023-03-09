import 'package:demo_navigator/navigation/radio_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:demo_navigator/navigation/app_link/app_link.dart';
import 'package:demo_navigator/screens/main_page/main_page.dart';
import '../app_state.dart';

class AppRouterDelegate extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppLink> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(notifyListeners);
  }

  AppState appState = AppState();

  RadioDetailState radioDetailState = RadioDetailState();

  void parseRoute(Uri? uri) {
    if (uri == null) return;
    if (uri.pathSegments.length == 1) {
      final path = uri.pathSegments[0];
      if (path == 'login') {
        appState.hasMoveToLogin = true;
        appState.hasInitialLink = true;
      } else if (path == 'app-top') {
        appState.selectedIndex = 0;
        appState.hasMoveToHomePage = true;
      } else if (path == 'register') {
        appState.hasMoveToRegister = true;
        appState.hasInitialLink = true;
      }
    }
  }

  @override
  Future<void> setNewRoutePath(AppLink configuration) async {
    final location = configuration.location;
    switch (location) {
      case AppLink.kLoginPath:
        appState.hasMoveToLogin = true;
        break;
      case AppLink.kHomePagePath:
        appState.selectedIndex = configuration.currentTab ?? 0;
        appState.hasMoveToHomePage = true;
        break;
      case AppLink.kRegisterPath:
        appState.hasMoveToRegister = true;
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
            key: const ValueKey('MainPage'),
            child: MainPage(appState: appState, radioDetailState: radioDetailState))
      ],
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }
}
