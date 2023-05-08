import 'package:flutter/material.dart';

class ColorControl extends ChangeNotifier {
  Color containerColorA = Colors.black;
  Color containerColorB = Colors.black;
  Color containerColorC = Colors.black;
  Color containerColorD = Colors.black;

  Color get colorA => containerColorA;
  Color get colorB => containerColorB;
  Color get colorC => containerColorC;
  Color get colorD => containerColorD;

  setColorA(Color color) {
    containerColorA = color;
    notifyListeners();
  }

  setColorB(Color color) {
    containerColorB = color;
    notifyListeners();
  }

  setColorC(Color color) {
    containerColorC = color;
    notifyListeners();
  }

  setColorD(Color color) {
    containerColorD = color;
    notifyListeners();
  }
}
