import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _originIndex;

  int get originIndex => _originIndex;

  set originIndex(newIndex){
    _originIndex = newIndex;
    notifyListeners();
  }

}