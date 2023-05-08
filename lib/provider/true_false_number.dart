import 'package:flutter/cupertino.dart';

class TrueFalseNumber extends ChangeNotifier {
  int trueNumber1 = 0;
  int falseNumber1 = 0;

  int get trueNumber => trueNumber1;
  int get falseNumber => falseNumber1;

  setTrueNumber(int value) {
    trueNumber1 = value;
    notifyListeners();
  }

  setFalseNumber(int value) {
    falseNumber1 = value;
    notifyListeners();
  }

  void increaseTrueNumber() {
    trueNumber1 = trueNumber1 + 1;
    notifyListeners();
  }

  void increaseFalseNumber() {
    falseNumber1 = falseNumber1 + 1;
    notifyListeners();
  }

  resetTest() {
    trueNumber1 = falseNumber1 = 0;
  }
}
