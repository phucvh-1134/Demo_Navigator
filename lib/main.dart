import 'dart:async';
import 'package:flutter/material.dart';
import 'package:demo_navigator/navigation/route_information_parser/route_information_parser.dart';
import 'package:demo_navigator/navigation/router_delegate/app_router_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

}

class MyAppState extends State<MyApp> {
  StreamSubscription? _sub;

  /*@override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }*/

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    /*if (_type == UniLinksType.string) {
      await initPlatformStateForStringUniLinks();
    } else {
      await initPlatformStateForUriUniLinks();
    }*/
    await initPlatformStateForStringUniLinks();
  }

  /// An implementation using a [String] link
  Future<void> initPlatformStateForStringUniLinks() async {
    /*// Attach a listener to the links stream
    if (!kIsWeb) {
      _sub = linkStream.listen((String? link) {
        if (!mounted) return;
        setState(() {
          _latestLink = link ?? 'Unknown';
          _latestUri = null;
          try {
            if (link != null) _latestUri = Uri.parse(link);
          } on FormatException {}
        });
      }, onError: (Object err) {
        if (!mounted) return;
        setState(() {
          _latestLink = 'Failed to get latest link: $err.';
          _latestUri = null;
        });
      });
    }*/

    /*// Attach a second listener to the stream
      _sub = uriLinkStream.listen((Uri? link) {
        if (kDebugMode) {
          print('Is move to handle deep link');
        }
        _appRouterDelegate.parseRoute(link);
      }, onError: (Object err) {});*/

    /*// Get the latest link
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _initialLink = await getInitialLink();
      if (_initialLink != null) _initialUri = Uri.parse(_initialLink!);
      _appRouterDelegate.parseRoute(_initialUri);
    } on PlatformException {}

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _latestLink = _initialLink;
      _latestUri = _initialUri;
    });*/
  }

  /*/// An implementation using the [Uri] convenience helpers
  Future<void> initPlatformStateForUriUniLinks() async {
    // Attach a listener to the Uri links stream
    if (!kIsWeb) {
      _sub = uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        setState(() {
          _latestUri = uri;
          _latestLink = uri?.toString() ?? 'Unknown';
        });
      }, onError: (Object err) {
        if (!mounted) return;
        setState(() {
          _latestUri = null;
          _latestLink = 'Failed to get latest link: $err.';
        });
      });
    }

    // Attach a second listener to the stream
    if (!kIsWeb) {
      uriLinkStream.listen((Uri? uri) {
        if (kDebugMode) {
          print('got uri: ${uri?.path} ${uri?.queryParametersAll}');
        }
      }, onError: (Object err) {
        if (kDebugMode) {
          print('got err: $err');
        }
      });
    }

    // Get the latest Uri
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _initialUri = await getInitialUri();
      if (kDebugMode) {
        print('initial uri: ${_initialUri?.path}'
          ' ${_initialUri?.queryParametersAll}');
      }
      _initialLink = _initialUri?.toString();
    } on PlatformException {
      _initialUri = null;
      _initialLink = 'Failed to get initial uri.';
    } on FormatException {
      _initialUri = null;
      _initialLink = 'Bad parse the initial link as Uri.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _latestUri = _initialUri;
      _latestLink = _initialLink;
    });
  }*/

  final AppRouterDelegate _appRouterDelegate = AppRouterDelegate();
  final AppRouteParser _appRouteParser = AppRouteParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouterDelegate,
      /*routeInformationParser: _appRouteParser,*/
    );
  }
}
