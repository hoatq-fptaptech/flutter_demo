import 'package:flutter/material.dart';

class AppBarProvider with ChangeNotifier {
  double _appBarHeight = 250.0; // Độ cao mặc định của SliverAppBar
  bool _appBarPinned = false;
  double _appBarRadius = 100;

  double get appBarHeight => _appBarHeight;

  set appBarHeight(double height) {
    _appBarHeight = height;
  }

  double get appBarRadius => _appBarRadius;

  set appBarRadius(double value) {
    _appBarRadius = value;
  }

  bool get appBarPinned => _appBarPinned;

  set appBarPinned(bool value) {
    _appBarPinned = value;
  }
  void changeHeight(){
    appBarHeight += 10;
    notifyListeners();
  }
}
