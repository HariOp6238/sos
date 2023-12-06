import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isdarkmode = false;

  bool get isdakmode => _isdarkmode;

  Toggletheme() {
    _isdarkmode = !_isdarkmode;
    notifyListeners();
  }
}
