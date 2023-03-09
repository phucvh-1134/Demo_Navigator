import 'package:flutter/material.dart';

class MyRouteInformation extends RouteInformation {
  const MyRouteInformation({this.location, this.state});

  final String location;

  final Object state;
}

class MyRouteInformationProvider extends RouteInformationProvider
    with ChangeNotifier {
  MyRouteInformationProvider({required RouteInformation initialRouteInformation})
      : _value = initialRouteInformation;

  @override
  RouteInformation get value => _value;
  RouteInformation _value;

  set value(RouteInformation other) {
    if (value == other) return;
    value = other;
    notifyListeners();
  }

  @override
  void routerReportsNewRouteInformation(RouteInformation routeInformation) {
    _value = routeInformation;
  }
}
