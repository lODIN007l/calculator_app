import 'package:flutter/material.dart';

class TemaEstado extends ChangeNotifier {
  bool _darkmode = false;

  ThemeData get temaActual {
    if (_darkmode == true) {
      return ThemeData.dark().copyWith(
          //backgroundColor: Color,
          accentColor: Color.fromRGBO(17, 19, 32, 1),
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.black26,
          toggleableActiveColor: Colors.red);
    } else {
      return ThemeData.light();
    }
  }

  bool get darkModeG => _darkmode;
  void darkModeS(bool valor) {
    _darkmode = valor;
    notifyListeners();
  }
}
