import 'package:flutter/cupertino.dart';

class RadioDetailState extends ChangeNotifier {

  int _counter = 0;

  int get counter => _counter;

  set counter(int counter) {
    _counter = counter;
    notifyListeners();
  }
}