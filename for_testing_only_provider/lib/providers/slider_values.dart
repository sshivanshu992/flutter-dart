import 'package:flutter/material.dart';

class SliderValueProvider with ChangeNotifier {
  double _slider = 0;
  double get slide => _slider;

  sliderSetValue(x) {
    _slider = x;
    notifyListeners();
  }
}
