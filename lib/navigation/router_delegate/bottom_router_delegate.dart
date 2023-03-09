import 'package:demo_navigator/navigation/arguments/radio_detail_argument.dart';
import 'package:demo_navigator/navigation/radio_detail_state.dart';
import 'package:demo_navigator/screens/radio_detail/radio_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo_navigator/navigation/app_state.dart';
import 'package:demo_navigator/screens/app_top/app_top_screen.dart';
import 'package:demo_navigator/screens/app_top_detail/app_top_detail.dart';
import 'package:demo_navigator/screens/radio/radio_screen.dart';
import 'package:demo_navigator/screens/settings/settings_screen.dart';
import 'package:demo_navigator/screens/settings_detail/settings_detail.dart';
import '../app_link/app_link.dart';

class BottomRouterDelegate extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppLink> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BottomRouterDelegate(this.appState, this.radioDetailState);

  AppState appState;

  RadioDetailState radioDetailState;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (appState.selectedIndex == 0) ...[
          MaterialPage(
              key: const ValueKey('AppTopScreen'),
              child: AppTopScreen(moveToAppTopDetail: _moveToAppTopDetail)),
          if (appState.hasMoveToAppTopDetail == true)
            MaterialPage(
                key: const ValueKey('AppTopDetailScreen'),
                child: AppTopDetailScreen(
                  onBackButtonTapped: _onBackButtonTapped,
                ))
        ] else if (appState.selectedIndex == 1) ...[
          MaterialPage(
              key: const ValueKey('SettingsScreen'),
              child: SettingsScreen(
                  onMoveToSettingsDetailScreen: _moveToSettingsDetail)),
          if (appState.hasMoveToSettingsDetail == true)
            MaterialPage(
                key: const ValueKey('SettingsDetailScreen'),
                child: SettingsDetailScreen(
                    onMoveToAppTopDetailTapped:
                        _moveToAppTopDetailFromAnotherTab))
        ] else ...[
          MaterialPage(
              key: const ValueKey('RadioScreen'),
              child: RadioScreen(
                radioDetailState: radioDetailState,
                radioDetailArgument: _passArgumentToRadioDetail,
              )),
          if (appState.hasMoveToRadioDetail == true)
            MaterialPage(
                key: const ValueKey('RadioDetailScreen'),
                child: RadioDetailScreen(counter: radioDetailState.counter))
        ]
      ],
      onPopPage: (route, result) {
        return _handleOnPopPage(route, result);
      },
    );
  }

  bool _handleOnPopPage(Route<dynamic> route, dynamic result) {
    Page page = route.settings as Page;
    var key = page.key;
    if (key == const ValueKey<String>('AppTopDetailScreen')) {
      _moveToAppTopDetail(false);
      return true;
    } else if (key == const ValueKey<String>('SettingsDetailScreen')) {
      _moveToSettingsDetail(false);
      return true;
    } else if (key == const ValueKey<String>('RadioDetailScreen')) {
      _passArgumentToRadioDetail(RadioDetailArgument(hasMoveToRadioDetail: false, counter: radioDetailState.counter));
    }
    return true;
  }

  void _moveToAppTopDetail(bool hasMoveToAppTopDetail) {
    appState.hasMoveToAppTopDetail = hasMoveToAppTopDetail;
  }

  void _moveToAppTopDetailFromAnotherTab(bool hasMoveToAppTopDetail) {
    appState.hasMoveToAppTopDetail = hasMoveToAppTopDetail;
    appState.selectedIndex = 0;
    appState.hasClickedMoveToAppTopDetail = true;
  }

  void _moveToSettingsDetail(bool hasMoveToSettingsDetail) {
    appState.hasMoveToSettingsDetail = hasMoveToSettingsDetail;
  }

  void _onBackButtonTapped(bool isTapped) {
    appState.hasTappedBackButton = isTapped;
    if (isTapped == true && appState.hasClickedMoveToAppTopDetail == true) {
      appState.hasMoveToAppTopDetail = false;
      appState.hasClickedMoveToAppTopDetail = false;
      appState.selectedIndex = 1;
    }
  }

  void _passArgumentToRadioDetail(RadioDetailArgument radioDetailArgument) {
    radioDetailState.counter = radioDetailArgument.counter;
    appState.hasMoveToRadioDetail = radioDetailArgument.hasMoveToRadioDetail;
  }

  @override
  Future<void> setNewRoutePath(AppLink configuration) async {}
}
