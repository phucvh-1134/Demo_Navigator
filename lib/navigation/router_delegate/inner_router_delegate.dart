import 'package:demo_navigator/navigation/radio_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:demo_navigator/navigation/app_link/app_link.dart';
import 'package:demo_navigator/navigation/app_state.dart';
import 'package:demo_navigator/screens/login_options/login_options_screen.dart';
import '../../screens/home_page/home_page_screen.dart';
import '../../screens/login/login_screen.dart';
import '../../screens/register/register_screen.dart';

class InnerRouterDelegate extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppLink> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  InnerRouterDelegate(this.appState, this.radioDetailState);

  AppState appState;

  RadioDetailState radioDetailState;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (appState.hasMoveToLoginOptions == true)
          MaterialPage(
              key: const ValueKey('LoginOptionsScreen'),
              child: LoginOptionsScreen(
                  onLoginTapped: _handleMoveToLogin,
                  onRegisterTapped: _handleMoveToRegister)),
        if (appState.hasMoveToRegister == true)
          MaterialPage(
              key: const ValueKey('RegisterScreen'),
              child: RegisterScreen(onMoveToLoginTapped: _handleMoveToLogin)),
        if (appState.hasMoveToLogIn == true)
          MaterialPage(
              key: const ValueKey('LoginScreen'),
              child: LoginScreen(
                  onMoveToHomePage: _handleMoveToHomePage,
                  onBackToLoginOptions: _handleBackToLoginOptions
              )
          ),
        if (appState.hasMoveToHomePage == true)
          MaterialPage(
              key: const ValueKey('HomePageScreen'),
              child: HomePageScreen(appState: appState, radioDetailState: radioDetailState)
          )
      ],
      onPopPage: (route, result) {
        return _handlePopPage(route, result);
      },
    );
  }

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    Page page = route.settings as Page;
    route.didPop(result);
    if (page.key == const ValueKey<String>('LoginScreen')) {
      _handleMoveToLogin(false);
      return true;
    } else if (page.key == const ValueKey<String>('RegisterScreen')) {
      _handleMoveToRegister(false);
      return true;
    } else if (page.key == const ValueKey<String>('HomePageScreen')) {
      _handleMoveToHomePage(false);
      return true;
    }
    return true;
  }

  void _handleMoveToLogin(bool hasMove) {
    appState.hasMoveToLogin = hasMove;
  }

  void _handleMoveToRegister(bool hasMove) {
    appState.hasMoveToRegister = hasMove;
  }

  void _handleMoveToHomePage(bool hasMove) {
    appState.hasMoveToHomePage = hasMove;
    appState.hasMoveToLogin = false;
    appState.hasMoveToRegister = false;
    appState.hasMoveToLoginOptions = false;
  }

  void _handleBackToLoginOptions(bool hasBack) {
    if (appState.hasInitialLink != true) {
      appState.hasMoveToLogin = false;
      appState.hasMoveToRegister = false;
      appState.hasMoveToLoginOptions = hasBack;
    } else {
      appState.hasMoveToLoginOptions = true;
      appState.hasInitialLink = false;
    }
  }

  @override
  Future<void> setNewRoutePath(AppLink configuration) async {}
}
