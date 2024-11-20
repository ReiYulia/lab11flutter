import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  int _red = 0;
  int _green = 0;
  int _blue = 0;

  int get red => _red;
  int get green => _green;
  int get blue => _blue;

  Color get color => Color.fromRGBO(_red, _green, _blue, 1);

  void setRed(int value) {
    _red = value;
    notifyListeners();
  }

  void setGreen(int value) {
    _green = value;
    notifyListeners();
  }

  void setBlue(int value) {
    _blue = value;
    notifyListeners();
  }
}
