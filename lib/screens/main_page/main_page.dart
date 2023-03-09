import 'package:demo_navigator/navigation/radio_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:demo_navigator/navigation/app_state.dart';
import 'package:demo_navigator/navigation/route_information_parser/route_information_parser.dart';
import 'package:demo_navigator/navigation/router_delegate/inner_router_delegate.dart';

class MainPage extends StatelessWidget {
  MainPage({required this.radioDetailState, required this.appState, super.key})
      : innerRouterDelegate = InnerRouterDelegate(appState, radioDetailState),
        _appRouteParser = AppRouteParser();

  final AppState appState;
  final RadioDetailState radioDetailState;
  final InnerRouterDelegate innerRouterDelegate;
  final AppRouteParser _appRouteParser;

  @override
  Widget build(BuildContext context) {
    final ChildBackButtonDispatcher backButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher();

    backButtonDispatcher.takePriority();

    return Scaffold(
      body: SafeArea(
        child: Router(
          backButtonDispatcher: backButtonDispatcher,
          routerDelegate: innerRouterDelegate,
          routeInformationParser: _appRouteParser,
        ),
      ),
    );
  }
}
