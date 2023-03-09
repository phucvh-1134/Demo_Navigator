/*
import 'package:demo_navigator/screens/demo_transition_delegate/demo_transition_delegate.dart';
import 'package:flutter/material.dart';

class NoAnimationTransitionDelegate extends TransitionDelegate<void> {
  @override
  Iterable<RouteTransitionRecord> resolve({
    required List<RouteTransitionRecord> newPageRouteHistory,
      required Map<RouteTransitionRecord?, RouteTransitionRecord>
          locationToExitingPageRoute,
      required Map<RouteTransitionRecord?, List<RouteTransitionRecord>>
          pageRouteToPagelessRoutes
      }) {
    // Decide what to do with the page
  }
}

class MyWidgetState extends State<MyWidget> {
  final TransitionDelegate _transitionDelegate = MyTransitionDelegate();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: pages,
      transitionDelegate: _transitionDelegate,
    );
  }
}
*/
