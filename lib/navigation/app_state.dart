import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _hasMoveToLogIn = false;
  bool _hasMoveToRegister = false;
  bool _hasMoveToHomePage = false;
  int _selectedIndex;
  bool _hasMoveToAppTopDetail = false;
  bool _hasBackToLoginOptions = false;
  bool _hasMoveToLoginOptions = true;
  bool _hasMoveToSettingsDetail = false;
  bool _hasClickedBackButton = false;
  bool _hasClickedMoveToAppTopDetail = false;
  bool _hasInitialLink = false;
  bool _hasMoveToRadioDetail = false;
  int _counter = 0;

  AppState() : _selectedIndex = 0;

  bool get hasMoveToLogIn => _hasMoveToLogIn;

  bool get hasMoveToRegister => _hasMoveToRegister;

  bool get hasMoveToHomePage => _hasMoveToHomePage;

  int get selectedIndex => _selectedIndex;

  bool get hasMoveToAppTopDetail => _hasMoveToAppTopDetail;

  bool get hasBackToLoginOptions => _hasBackToLoginOptions;

  bool get hasMoveToLoginOptions => _hasMoveToLoginOptions;

  bool get hasMoveToSettingsDetail => _hasMoveToSettingsDetail;

  bool get hasTappedBackButton => _hasClickedBackButton;

  bool get hasClickedMoveToAppTopDetail => _hasClickedMoveToAppTopDetail;

  bool get hasInitialLink => _hasInitialLink;

  bool get hasMoveToRadioDetail => _hasMoveToRadioDetail;

  int get counter => _counter;

  set hasMoveToLogin(bool hasMove) {
    _hasMoveToLogIn = hasMove;
    notifyListeners();
  }

  set hasMoveToRegister(bool hasMove) {
    _hasMoveToRegister = hasMove;
    notifyListeners();
  }

  set hasMoveToHomePage(bool hasMove) {
    _hasMoveToHomePage = hasMove;
    notifyListeners();
  }

  set selectedIndex(int selectedIndex) {
    _selectedIndex = selectedIndex;
    notifyListeners();
  }

  set hasMoveToAppTopDetail(bool hasMoveToAppTopDetail) {
    _hasMoveToAppTopDetail = hasMoveToAppTopDetail;
    notifyListeners();
  }

  set hasBackToLoginOptions(bool hasBackToLoginOptions) {
    _hasBackToLoginOptions = hasBackToLoginOptions;
    notifyListeners();
  }

  set hasMoveToLoginOptions(bool hasMoveToLoginOptions) {
    _hasMoveToLoginOptions = hasMoveToLoginOptions;
    notifyListeners();
  }

  set hasMoveToSettingsDetail(bool hasMoveToSettingsDetail) {
    _hasMoveToSettingsDetail = hasMoveToSettingsDetail;
    notifyListeners();
  }

  set hasTappedBackButton(bool hasClicked) {
    _hasClickedBackButton = hasClicked;
    notifyListeners();
  }

  set hasClickedMoveToAppTopDetail(bool hasClicked) {
    _hasClickedMoveToAppTopDetail = hasClicked;
    notifyListeners();
  }

  set hasInitialLink(bool hasInitialLink) {
    _hasInitialLink = hasInitialLink;
    notifyListeners();
  }

  set hasMoveToRadioDetail(bool hasMove) {
    _hasMoveToRadioDetail = hasMove;
    notifyListeners();
  }

  set counter(int counter) {
    _counter = counter;
    notifyListeners();
  }
}
